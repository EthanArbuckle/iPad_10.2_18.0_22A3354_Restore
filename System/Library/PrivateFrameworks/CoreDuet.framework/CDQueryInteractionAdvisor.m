@implementation CDQueryInteractionAdvisor

void __82___CDQueryInteractionAdvisor_adviseInteractionsForKeywordsInString_usingSettings___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v5 = a2;
  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
    v12 = v5;
    v7 = a3;
    objc_msgSend(v6, "objectForKeyedSubscript:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v12);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", a1[6]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "setObject:forKeyedSubscript:", v8, v12);
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v10 + 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v7);

    v5 = v12;
  }

}

uint64_t __82___CDQueryInteractionAdvisor_adviseInteractionsForKeywordsInString_usingSettings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "score");
  v6 = v5;
  objc_msgSend(v4, "score");
  v8 = v7;

  if (v6 <= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v6 < v8)
    return 1;
  else
    return v9;
}

@end
