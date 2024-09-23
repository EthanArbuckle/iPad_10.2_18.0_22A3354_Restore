@implementation MapsSuggestionsFrequentLocationDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  if (MapsSuggestionsEntriesAreBothOfType(4, v6, v5)
    && (objc_msgSend(v5, "uniqueIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "uniqueIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqualToString:", v8),
        v8,
        v7,
        v9))
  {
    v10 = 1;
    objc_msgSend(v5, "mergeFromSuggestionEntry:behavior:", v6, 1);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end
