@implementation ATXWatchSmartStacksLayoutSelector

- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "_pas_filteredArrayWithTest:", &__block_literal_global_206);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subarrayWithRange:", 0, objc_msgSend(v4, "count") != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81220]), "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:", 17, 0, v5, 0, 0, 0, 0, 0);
  return v6;
}

BOOL __88__ATXWatchSmartStacksLayoutSelector_selectedLayoutForConsumerSubType_rankedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  Class v10;
  id v11;
  void *v12;
  id v13;

  v2 = a2;
  objc_msgSend(v2, "executableSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "executableType");

  if (v4 == 3
    && (objc_msgSend(v2, "scoreSpecification"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "suggestedConfidenceCategory"),
        v5,
        v6 >= 3))
  {
    objc_msgSend(v2, "executableSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executableObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = NSClassFromString(CFSTR("ATXInfoSuggestion"));
    v11 = v9;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    v7 = v13 != 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
