@implementation ATXHomeScreenPageState

uint64_t __42___ATXHomeScreenPageState_pinnedSGWidgets__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPinnedSuggestionsWidget");

  return v3;
}

uint64_t __37___ATXHomeScreenPageState_pinnedAPPs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppPredictionPanel");

  return v3;
}

void __53___ATXHomeScreenPageState__isShowingApp_allowFolder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  objc_msgSend(a2, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

@end
