@implementation SFNavigationIntentBuilder

id __66___SFNavigationIntentBuilder_navigationIntentWithOpenURLContexts___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_initializeNavigationIntentWithType:value:", 7, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "externalURLSourceApplicationIsSpotlight"))
    objc_msgSend(v2, "setProvenance:", 3);
  return v2;
}

void __84___SFNavigationIntentBuilder_buildNavigationIntentForDropSession_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_navigationIntentWithItems:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __86___SFNavigationIntentBuilder_buildNavigationIntentForItemProviders_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_navigationIntentWithItems:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

id __57___SFNavigationIntentBuilder__navigationIntentWithItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_navigationIntentForMKMapItem:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v7 = (void *)v4;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationIntentWithBookmark:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v9 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v9, "navigationIntentWithRecentlyClosedTabStateData:", v3);
    else
      objc_msgSend(v9, "navigationIntentWithText:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "safari_originalDataAsString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationIntentWithText:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v7;
}

@end
