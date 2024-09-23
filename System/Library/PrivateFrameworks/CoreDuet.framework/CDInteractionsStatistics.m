@implementation CDInteractionsStatistics

void __49___CDInteractionsStatistics_descriptionRedacted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    v7 = *(void **)(a1 + 40);
    v8 = a3;
    objc_msgSend(v7, "privatizedConversationId:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("conversationId: %@ \n"), v9);

  }
  else
  {
    v10 = a3;
    objc_msgSend(v6, "appendFormat:", CFSTR("conversationId: %@ \n"), a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\tnumberOfFeatures: %tu \n"), objc_msgSend(a3, "count"));
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49___CDInteractionsStatistics_descriptionRedacted___block_invoke_2;
  v17[3] = &unk_1E26E6950;
  v18 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v17);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKeyedSubscript:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendFormat:", CFSTR("\tnumberOfProperties: %tu \n"), objc_msgSend(v13, "count"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKeyedSubscript:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __49___CDInteractionsStatistics_descriptionRedacted___block_invoke_3;
  v15[3] = &unk_1E26E6978;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v15);

}

uint64_t __49___CDInteractionsStatistics_descriptionRedacted___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t\t%@: %@ \n"), a2, a3);
}

uint64_t __49___CDInteractionsStatistics_descriptionRedacted___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t\t%@: %@\n"), a2, a3);
}

void __73___CDInteractionsStatistics_computePASSFeatureWithPeopleDetectedInPhoto___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73___CDInteractionsStatistics_computePASSFeatureWithPeopleDetectedInPhoto___block_invoke_2;
  v8[3] = &unk_1E26E69C8;
  v4 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("@max.self"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setValue:forFeature:andConversationId:", v6, CFSTR("numberOfSharesOfDetectedPeopleWithConversation"), v7);

}

id __73___CDInteractionsStatistics_computePASSFeatureWithPeopleDetectedInPhoto___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
