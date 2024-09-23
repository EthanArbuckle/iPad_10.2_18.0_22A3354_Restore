@implementation WebBookmark

void __87__WebBookmark_SafariServicesExtras___sf_webBookmarksFromDropSession_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id __87__WebBookmark_SafariServicesExtras___sf_webBookmarksFromDropSession_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v2;
  v5 = v4;
  v6 = v4;
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v4, "safari_originalDataAsString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = v8;
    else
      v9 = v7;
    v10 = v9;

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DCCB98]), "initWithTitle:address:collectionType:", v10, v7, 0);
  }

  return v6;
}

void __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setURL:", v4);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setString:", v3);
  }

}

void __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "descendantsOfBookmarkFolder:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_33);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setItems:", v1);

}

id __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void **v6;
  uint64_t *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v12 = *MEMORY[0x1E0CA5C90];
    v13[0] = v3;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = (void **)v13;
    v7 = &v12;
  }
  else
  {
    if (!v2)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v10 = *MEMORY[0x1E0CA5CA0];
    v11 = v2;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = &v11;
    v7 = &v10;
  }
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v8;
}

id __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = objc_msgSend(MEMORY[0x1E0D4EF68], "effectiveTabOrderWithPreferredTabOrder:", a2);
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_BYTE *)(a1 + 32) || v3 != 2)
  {
    _WBSLocalizedString();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

void __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_5(uint64_t a1, uint64_t a2, char a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;

  objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredTabOrder:", a2);
  if (a2 == 1)
    v7 = *(unsigned __int8 *)(a1 + 64);
  else
    v7 = 0;
  objc_msgSend(v6, "setNeverPromptWhenOpeningMultipleIntents:", v7);
  if ((objc_msgSend(*(id *)(a1 + 32), "hasActiveLibrary") & 1) == 0)
    objc_msgSend(v6, "setPrefersOpenInNewTab:", 1);
  objc_msgSend(v6, "navigationIntentWithBookmark:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_6;
  v11[3] = &unk_1E4AC0BC8;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  v9 = *(void **)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 40);
  v12 = v8;
  v13 = v9;
  v16 = a3;
  v14 = *(id *)(a1 + 32);
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v15);
}

void __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "bookmark:didProduceNavigationIntent:userInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 56), "removeSingleBlankTabFromActiveTabGroup");
}

uint64_t __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_9(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "editBookmark:userInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v5 = *(void **)(a1 + 40);
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "bookmark:shareItems:userInfo:", v3, v6, *(_QWORD *)(a1 + 48));

}

void __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_11(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "descendantsOfBookmarkFolder:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_62);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "bookmark:shareItems:userInfo:", *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 48));

}

id __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  v5 = v3;

  return v5;
}

void __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "deleteBookmark:userInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didRemoveFrequentlyVisitedSite");

  }
}

void __112__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_withUserInfo_handler___block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "deleteBookmark:userInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didRemoveFrequentlyVisitedSite");

  }
}

@end
