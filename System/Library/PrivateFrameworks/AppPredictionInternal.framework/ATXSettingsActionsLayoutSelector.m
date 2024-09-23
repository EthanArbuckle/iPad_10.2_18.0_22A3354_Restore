@implementation ATXSettingsActionsLayoutSelector

- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = (void *)MEMORY[0x1E0D81198];
  v5 = a4;
  objc_msgSend(v4, "clientModelIdFromClientModelType:", 48);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__ATXSettingsActionsLayoutSelector_selectedLayoutForConsumerSubType_rankedSuggestions___block_invoke;
  v11[3] = &unk_1E82DE058;
  v12 = v6;
  v7 = v6;
  objc_msgSend(v5, "_pas_filteredArrayWithTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81220]), "initWithLayoutType:oneByOneSuggestions:oneByTwoSuggestions:twoByTwoSuggestions:oneByFourSuggestions:twoByFourSuggestions:fourByFourSuggestions:fourByEightSuggestions:", 17, 0, v8, 0, 0, 0, 0, 0);
  return v9;
}

uint64_t __87__ATXSettingsActionsLayoutSelector_selectedLayoutForConsumerSubType_rankedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "clientModelSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientModelId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

@end
