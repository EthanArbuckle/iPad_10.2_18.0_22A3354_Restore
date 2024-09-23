@implementation CDInteractionAdvisorUtils

BOOL __157___CDInteractionAdvisorUtils_adviceBasedOnInteractions_forContacts_andRanker_ignoringContacts_withLimit_aggregateByIdentifier_requireOneOutgoingInteraction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "similarOutgoingInteractionsCount") > 0;
}

uint64_t __73___CDInteractionAdvisorUtils_rankContacts_basedOnInteractions_andRanker___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  if (v10 <= v15)
    v16 = 0;
  else
    v16 = -1;
  if (v10 < v15)
    return 1;
  else
    return v16;
}

@end
