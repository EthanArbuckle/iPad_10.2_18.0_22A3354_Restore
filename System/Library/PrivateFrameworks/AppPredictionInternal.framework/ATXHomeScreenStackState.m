@implementation ATXHomeScreenStackState

uint64_t __52___ATXHomeScreenStackState_setTopOfStackSuggestion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "widget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetUniqueId");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "widgetUniqueId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "widget");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetUniqueId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "widgetUniqueId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

LABEL_7:
  return v10;
}

uint64_t __73___ATXHomeScreenStackState_widgetForSuggestion_considerSuggestedWidgets___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isWidget:showingIdenticalContentOfSuggestion:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __73___ATXHomeScreenStackState_widgetForSuggestion_considerSuggestedWidgets___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "extensionBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CF9480]);

  return v3;
}

@end
