@implementation GEOStrictRegionAutocompleteFilter

- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  id v4;
  GEOPDAutocompleteFilter *v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "hasAutocompleteFilter") & 1) == 0)
  {
    v5 = objc_alloc_init(GEOPDAutocompleteFilter);
    objc_msgSend(v4, "setAutocompleteFilter:", v5);

  }
  objc_msgSend(v4, "autocompleteFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsStrictMapRegion:", 1);

  return 1;
}

@end
