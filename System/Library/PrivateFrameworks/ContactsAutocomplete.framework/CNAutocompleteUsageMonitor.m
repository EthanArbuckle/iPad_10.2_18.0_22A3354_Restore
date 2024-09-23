@implementation CNAutocompleteUsageMonitor

+ (void)userSelectedResult:(id)a3 atSortedIndex:(unint64_t)a4 forRequest:(id)a5 gotResultsFromDuet:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;

  v6 = a6;
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init((Class)a1);
  objc_msgSend(v12, "userSelectedResult:atSortedIndex:forRequest:gotResultsFromDuet:", v11, a4, v10, v6);

}

+ (void)userIgnoredResultsForRequest:(id)a3 afterDelay:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  objc_msgSend(v7, "userIgnoredResultsOfBatch:forRequest:afterDelay:", 0, v6, a4);

}

- (CNAutocompleteUsageMonitor)init
{
  void *v3;
  CNAutocompleteUsageMonitor *v4;

  +[CNAutocompleteProbeProviderFactory defaultProbeProvider](CNAutocompleteProbeProviderFactory, "defaultProbeProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNAutocompleteUsageMonitor initWithProbeProvider:](self, "initWithProbeProvider:", v3);

  return v4;
}

- (CNAutocompleteUsageMonitor)initWithProbeProvider:(id)a3
{
  id v5;
  CNAutocompleteUsageMonitor *v6;
  CNAutocompleteUsageMonitor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNAutocompleteUsageMonitor;
  v6 = -[CNAutocompleteUsageMonitor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_probeProvider, a3);

  return v7;
}

- (void)userSelectedResult:(id)a3 atSortedIndex:(unint64_t)a4 forRequest:(id)a5 gotResultsFromDuet:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a6;
  v18 = a3;
  v10 = a5;
  if (v10)
  {
    -[CNAutocompleteUsageMonitor probeProvider](self, "probeProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "usageMonitorProbe");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "recordDuetReturnedResults:", v6);
    v13 = *MEMORY[0x1E0D13848];
    objc_msgSend(v10, "searchString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v14);

    if ((_DWORD)v13)
    {
      objc_msgSend(v12, "recordUserSelectedPredictionAtIndex:", a4);
    }
    else
    {
      objc_msgSend(v12, "recordUserSelectedIndex:", a4);
      objc_msgSend(v10, "searchString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "recordUserTypedInNumberOfCharacters:", objc_msgSend(v15, "length"));

      objc_msgSend(v12, "recordUserSelectedResultWithSourceType:", objc_msgSend(v18, "sourceType"));
      if (v18)
      {
        -[CNAutocompleteUsageMonitor probeProvider](self, "probeProvider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "suggestionsProbe");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "recordUserSelectedAutocompleteResult:", v18);
        objc_msgSend(v17, "sendData");

      }
    }
    objc_msgSend(v12, "sendData");

  }
}

- (void)userIgnoredResultsOfBatch:(unint64_t)a3 forRequest:(id)a4 afterDelay:(double)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v8 = a4;
  -[CNAutocompleteUsageMonitor probeProvider](self, "probeProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "usageMonitorProbe");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0D13848];
  objc_msgSend(v8, "searchString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v10) = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  if ((_DWORD)v10)
    objc_msgSend(v12, "recordUserIgnoredPredictionAfterDelay:", a5);
  else
    objc_msgSend(v12, "recordUserIgnoredPrefixedResultAfterDelay:batch:", a3, a5);
  objc_msgSend(v12, "sendData");

}

- (void)userSawNumberOfResults:(unint64_t)a3 forBatch:(unint64_t)a4 includingNumberOfSuggestions:(unint64_t)a5 forRequest:(id)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  id v14;

  v9 = a6;
  -[CNAutocompleteUsageMonitor probeProvider](self, "probeProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "usageMonitorProbe");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0D13848];
  objc_msgSend(v9, "searchString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  if ((_DWORD)v11)
    objc_msgSend(v14, "recordUserSawPredictions");
  if (a5)
    objc_msgSend(v14, "recordUserSawResultsConsideredSuggestion:", a5);
  v13 = a3 - a5;
  if (a3 != a5)
    objc_msgSend(v14, "recordUserSawCuratedResults:", v13);
  objc_msgSend(v14, "sendData", v13);

}

- (CNAutocompleteProbeProvider)probeProvider
{
  return self->_probeProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeProvider, 0);
}

@end
