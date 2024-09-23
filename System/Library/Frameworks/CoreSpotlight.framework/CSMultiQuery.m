@implementation CSMultiQuery

void __51___CSMultiQuery_initWithQueries_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setError:", v6);
  }
  else
  {
    v5 = objc_msgSend(WeakRetained, "foundItemCount");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCount:", v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
}

void __22___CSMultiQuery_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void (**v5)(void *, _QWORD);
  uint64_t v6;
  uint8_t v7[16];

  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_18C42F000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CSMultiQuery", (const char *)&unk_18C505DC6, v7, 2u);
  }

  v5 = (void (**)(void *, _QWORD))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 40) + 32));
  v5[2](v5, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  v6 = *(_QWORD *)(a1 + 40);
  if (*(void (***)(void *, _QWORD))(v6 + 32) == v5)
  {
    *(_QWORD *)(v6 + 32) = 0;

  }
}

void __41___CSMultiQuery_startSimpleQueryAtIndex___block_invoke(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  void *v5;

  v4 = a2 & a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCount:", v4);

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 16));
}

void __90___CSMultiQuery_countingQueryWithPeopleSuggestions_filterQuery_context_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
