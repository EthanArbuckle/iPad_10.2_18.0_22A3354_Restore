@implementation CKMediaObjectAssetMenuBuilder

- (id)contextMenuForChatItems:(id)a3 cursorChatItem:(id)a4 isCMM:(BOOL)a5
{
  id v8;
  id v9;
  void (**v10)(void *, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD aBlock[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__9;
  v23 = __Block_byref_object_dispose__9;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__CKMediaObjectAssetMenuBuilder_contextMenuForChatItems_cursorChatItem_isCMM___block_invoke;
  aBlock[3] = &unk_1E274C240;
  aBlock[4] = &v19;
  v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[CKMediaObjectAssetMenuBuilder _quickLookAndOpenMenuForChatItems:cursorChatItem:](self, "_quickLookAndOpenMenuForChatItems:cursorChatItem:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v11);

  -[CKMediaObjectAssetMenuBuilder _exportMenuForChatItem:](self, "_exportMenuForChatItem:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v12);

  if (!a5)
  {
    -[CKMediaObjectAssetMenuBuilder _tapbackAndReplyMenuForChatItems:](self, "_tapbackAndReplyMenuForChatItems:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v13);

  }
  -[CKMediaObjectAssetMenuBuilder _forwardAndCopyMenuForChatItems:](self, "_forwardAndCopyMenuForChatItems:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v14);

  if (!a5)
  {
    -[CKMediaObjectAssetMenuBuilder _deleteMenuForChatItems:](self, "_deleteMenuForChatItems:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v15);

  }
  if (objc_msgSend((id)v20[5], "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E276D870, v20[5]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v16;
}

uint64_t __78__CKMediaObjectAssetMenuBuilder_contextMenuForChatItems_cursorChatItem_isCMM___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40), "addObject:", a2);
  return result;
}

- (id)_quickLookAndOpenMenuForChatItems:(id)a3 cursorChatItem:(id)a4
{
  void *v4;
  void *v5;

  -[CKMediaObjectAssetMenuBuilder _quickLookAndOpenActionsForChatItems:cursorChatItem:](self, "_quickLookAndOpenActionsForChatItems:cursorChatItem:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_quickLookAndOpenActionsForChatItems:(id)a3 cursorChatItem:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObjectAssetMenuBuilder _quickLookActionForChatItems:cursorChatItem:](self, "_quickLookActionForChatItems:cursorChatItem:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMediaObjectAssetMenuBuilder _openActionForChatItems:](self, "_openActionForChatItems:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v9, "addObject:", v10);
  if (v11)
    objc_msgSend(v9, "addObject:", v11);

  return v9;
}

- (id)_quickLookActionForChatItems:(id)a3 cursorChatItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  location = 0;
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("QUICK_LOOK_MENU"), &stru_1E276D870, CFSTR("ChatKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__CKMediaObjectAssetMenuBuilder__quickLookActionForChatItems_cursorChatItem___block_invoke;
  v14[3] = &unk_1E274B010;
  objc_copyWeak(&v16, &location);
  v11 = v7;
  v15 = v11;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

void __77__CKMediaObjectAssetMenuBuilder__quickLookActionForChatItems_cursorChatItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_quickLookChatItem:", *(_QWORD *)(a1 + 32));

}

- (void)_quickLookChatItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMediaObjectAssetMenuBuilder delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuBuilder:quickLookChatItem:", self, v4);

}

- (id)_openActionForChatItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "mediaObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fileURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v5, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    location = 0;
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OPEN"), &stru_1E276D870, CFSTR("ChatKit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__CKMediaObjectAssetMenuBuilder__openActionForChatItems___block_invoke;
    v18[3] = &unk_1E274B010;
    objc_copyWeak(&v20, &location);
    v19 = v5;
    objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v15, 0, 0, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __57__CKMediaObjectAssetMenuBuilder__openActionForChatItems___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_openFiles:", *(_QWORD *)(a1 + 32));

}

- (void)_openFiles:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CKMediaObjectAssetMenuBuilder _openFile:](self, "_openFile:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_openFile:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99E98];
  v4 = a3;
  v6 = (id)objc_msgSend([v3 alloc], "initFileURLWithPath:", v4);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openURL:configuration:completionHandler:", v6, 0, 0);

  }
}

- (id)_exportMenuForChatItem:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[CKMediaObjectAssetMenuBuilder _exportActionForChatItems:](self, "_exportActionForChatItems:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CEA740];
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_exportActionForChatItems:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v10, "canExport"))
        {
          objc_msgSend(v10, "mediaObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    v12 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SEARCH_ADD_TO_PHOTOS_LIBRARY"), &stru_1E276D870, CFSTR("ChatKit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__CKMediaObjectAssetMenuBuilder__exportActionForChatItems___block_invoke;
    v17[3] = &unk_1E274B178;
    v18 = v4;
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v14, 0, 0, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __59__CKMediaObjectAssetMenuBuilder__exportActionForChatItems___block_invoke(uint64_t a1)
{
  CKMediaObjectExportManager *v2;
  _QWORD v3[4];
  id v4;

  v2 = -[CKMediaObjectExportManager initWithMediaObjects:]([CKMediaObjectExportManager alloc], "initWithMediaObjects:", *(_QWORD *)(a1 + 32));
  -[CKMediaObjectExportManager setMetricsSource:](v2, "setMetricsSource:", *MEMORY[0x1E0D388C0]);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__CKMediaObjectAssetMenuBuilder__exportActionForChatItems___block_invoke_2;
  v3[3] = &unk_1E274B1A0;
  v4 = *(id *)(a1 + 32);
  -[CKMediaObjectExportManager exportQueuedMediaObjectsWithCompletion:](v2, "exportQueuedMediaObjectsWithCompletion:", v3);

}

void __59__CKMediaObjectAssetMenuBuilder__exportActionForChatItems___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = IMOSLoggingEnabled();
  if (a2)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(void **)(a1 + 32);
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Successfully quick saved media objects: %@", (uint8_t *)&v10, 0xCu);
      }
LABEL_9:

    }
  }
  else if (v6)
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Error quick saving media objects. error: %@, mediaObjects: %@", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_9;
  }

}

- (id)_tapbackAndReplyMenuForChatItems:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1
    && (-[CKMediaObjectAssetMenuBuilder delegate](self, "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "shouldHideInteractionsForMenuBuilder:", self),
        v5,
        (v6 & 1) == 0))
  {
    objc_msgSend(v4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEmojiTapbacksEnabled");

    if (v11)
    {
      -[CKMediaObjectAssetMenuBuilder _tapbackElementsForChatItem:](self, "_tapbackElementsForChatItem:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v9, "addObjectsFromArray:", v12);
    }
    else
    {
      -[CKMediaObjectAssetMenuBuilder _tapbackActionForChatItem:](self, "_tapbackActionForChatItem:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v9, "addObject:", v12);
    }

    -[CKMediaObjectAssetMenuBuilder _replyActionForChatItem:](self, "_replyActionForChatItem:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v9, "addObject:", v13);
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_tapbackActionForChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TRANSCRIPT_TAPBACK_MENU_ELLIPSIS"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__CKMediaObjectAssetMenuBuilder__tapbackActionForChatItem___block_invoke;
  v11[3] = &unk_1E274B010;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v12 = v8;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v7, 0, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __59__CKMediaObjectAssetMenuBuilder__tapbackActionForChatItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_tapbackChatItem:", *(_QWORD *)(a1 + 32));

}

- (id)_tapbackElementsForChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKMediaObjectAssetMenuBuilder delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuBuilder:tapbackElementsForChatItem:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_tapbackChatItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMediaObjectAssetMenuBuilder delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuBuilder:tapbackChatItem:", self, v4);

}

- (id)_replyActionForChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("INLINE_REPLY_MENU"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__CKMediaObjectAssetMenuBuilder__replyActionForChatItem___block_invoke;
  v11[3] = &unk_1E274B010;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v12 = v8;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v7, 0, 0, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __57__CKMediaObjectAssetMenuBuilder__replyActionForChatItem___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_replyToChatItem:", *(_QWORD *)(a1 + 32));

}

- (void)_replyToChatItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMediaObjectAssetMenuBuilder delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuBuilder:replyChatItem:", self, v4);

}

- (id)_forwardAndCopyMenuForChatItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObjectAssetMenuBuilder _forwardActionForChatItems:](self, "_forwardActionForChatItems:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  v7 = -[CKMediaObjectAssetMenuBuilder _copyActionForChatItems:](self, "_copyActionForChatItems:", v4);
  if (v7)
    objc_msgSend(v5, "addObject:", v7);
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_forwardActionForChatItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v10, "canForward"))
          objc_msgSend(v5, "addObject:", v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    location = 0;
    objc_initWeak(&location, self);
    v11 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FORWARD_ELLIPSIS"), &stru_1E276D870, CFSTR("ChatKit"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__CKMediaObjectAssetMenuBuilder__forwardActionForChatItems___block_invoke;
    v16[3] = &unk_1E274B010;
    objc_copyWeak(&v18, &location);
    v17 = v6;
    objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v13, 0, 0, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __60__CKMediaObjectAssetMenuBuilder__forwardActionForChatItems___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_forwardChatItems:", *(_QWORD *)(a1 + 32));

}

- (void)_forwardChatItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMediaObjectAssetMenuBuilder delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuBuilder:forwardChatItems:", self, v4);

}

- (id)_copyActionForChatItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v10, "canCopy"))
          objc_msgSend(v5, "addObject:", v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    location = 0;
    objc_initWeak(&location, self);
    v11 = (void *)MEMORY[0x1E0CEA2A8];
    CKFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("COPY"), &stru_1E276D870, CFSTR("ChatKit"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__CKMediaObjectAssetMenuBuilder__copyActionForChatItems___block_invoke;
    v16[3] = &unk_1E274B010;
    objc_copyWeak(&v18, &location);
    v17 = v5;
    objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v13, 0, 0, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __57__CKMediaObjectAssetMenuBuilder__copyActionForChatItems___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_copyChatItems:", *(_QWORD *)(a1 + 32));

}

- (void)_copyChatItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMediaObjectAssetMenuBuilder delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuBuilder:copyChatItems:", self, v4);

}

- (id)_deleteMenuForChatItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0CEA2A8];
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE_ELLIPSIS"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__CKMediaObjectAssetMenuBuilder__deleteMenuForChatItems___block_invoke;
  v14[3] = &unk_1E274B010;
  objc_copyWeak(&v16, &location);
  v8 = v4;
  v15 = v8;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v7, 0, 0, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CEA740];
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

void __57__CKMediaObjectAssetMenuBuilder__deleteMenuForChatItems___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_deleteChatItems:", *(_QWORD *)(a1 + 32));

}

- (void)_deleteChatItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMediaObjectAssetMenuBuilder delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuBuilder:deleteChatItems:", self, v4);

}

- (CKMediaObjectAssetMenuBuilderDelegate)delegate
{
  return (CKMediaObjectAssetMenuBuilderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
