@implementation SFBrowserSavedState

void __47___SFBrowserSavedState_sharedBrowserSavedState__block_invoke(uint64_t a1)
{
  void (**v1)(void);
  uint64_t v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47___SFBrowserSavedState_sharedBrowserSavedState__block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e27____SFBrowserSavedState_8__0l;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v1 = (void (**)(void))_Block_copy(aBlock);
  v1[2]();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedBrowserSavedStateInstance;
  sharedBrowserSavedStateInstance = v2;

}

uint64_t __47___SFBrowserSavedState_sharedBrowserSavedState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "defaultBrowserStateDatabase");
}

uint64_t __71___SFBrowserSavedState_loadSessionStateDataAndRemoveRecentlyClosedTab___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

uint64_t __72___SFBrowserSavedState_clearRecentlyClosedTabsForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "profileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "profileIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (id)*MEMORY[0x1E0D89E20];
  }
  v6 = v5;

  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));
  return v7;
}

uint64_t __67___SFBrowserSavedState_recentlyClosedTabsForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "profileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "profileIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (id)*MEMORY[0x1E0D89E20];
  }
  v6 = v5;

  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));
  return v7;
}

id __49___SFBrowserSavedState__historyItemsWereRemoved___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "url");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __49___SFBrowserSavedState__historyItemsWereRemoved___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v3, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_bestURLForUserTypedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "containsObject:", v8);

  return v9;
}

@end
