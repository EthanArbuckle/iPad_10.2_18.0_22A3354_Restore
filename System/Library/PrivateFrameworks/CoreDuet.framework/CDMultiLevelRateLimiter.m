@implementation CDMultiLevelRateLimiter

uint64_t __53___CDMultiLevelRateLimiter_initWithPeriodToCountMap___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __34___CDMultiLevelRateLimiter_credit__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "recordTimeAndRefillIfNeededRaw");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(uint64_t *)(v2 + 24) >= 1)
  {
    v3 = 0;
    do
    {
      objc_msgSend(*(id *)(v2 + 56), "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "integerValue");

      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5 - 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:atIndexedSubscript:", v6, v3);

      }
      ++v3;
      v2 = *(_QWORD *)(a1 + 32);
    }
    while (v3 < *(_QWORD *)(v2 + 24));
  }
}

void __35___CDMultiLevelRateLimiter_debited__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "recordTimeAndRefillIfNeededRaw");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  while (v2 > 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectAtIndexedSubscript:", --v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectAtIndexedSubscript:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    if (v4 == v6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      return;
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (*(uint64_t *)(v7 + 24) >= 1)
  {
    v8 = 0;
    do
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(v7 + 56), "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "integerValue") + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:atIndexedSubscript:", v11, v8);

      ++v8;
      v7 = *(_QWORD *)(a1 + 32);
    }
    while (v8 < *(_QWORD *)(v7 + 24));
  }
}

@end
