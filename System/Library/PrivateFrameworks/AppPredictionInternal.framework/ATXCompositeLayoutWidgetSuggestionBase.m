@implementation ATXCompositeLayoutWidgetSuggestionBase

void __81___ATXCompositeLayoutWidgetSuggestionBase_addSuggestion_asMainSuggestion_dryRun___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;

  v6 = (void *)a1[4];
  v7 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1[5] + 64), "objectForKeyedSubscript:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count") < v9)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }

}

uint64_t __71___ATXCompositeLayoutWidgetSuggestionBase__existingSuggestionsInLayout__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

@end
