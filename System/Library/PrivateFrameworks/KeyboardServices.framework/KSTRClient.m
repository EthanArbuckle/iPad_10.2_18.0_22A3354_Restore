@implementation KSTRClient

uint64_t __50___KSTRClient_addEntries_removeEntries_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52___KSTRClient_queryTextReplacementEntriesWithReply___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  void *v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

void __56___KSTRClient_queryTextReplacementsWithPredicate_reply___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  void *v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

@end
