@implementation CSItemSummary

uint64_t __51__CSItemSummary_MailUIPredicates___personPredicate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D1E250], "spotlightSenderSearchPredicateForValue:operator:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __51__CSItemSummary_MailUIPredicates___personPredicate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D1E250], "spotlightRecipientSearchPredicateForValue:operator:", a2, *(_QWORD *)(a1 + 32));
}

id __51__CSItemSummary_MailUIPredicates___personPredicate__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  v4 = (void *)MEMORY[0x1E0D1E250];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v4, "spotlightSenderSearchPredicateForValue:operator:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0D1E250], "spotlightRecipientSearchPredicateForValue:operator:", v6, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
