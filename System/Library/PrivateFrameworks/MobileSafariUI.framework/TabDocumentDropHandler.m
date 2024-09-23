@implementation TabDocumentDropHandler

- (TabDocumentDropHandler)initWithAlertPresentationViewController:(id)a3
{
  id v4;
  void *v5;
  TabDocumentDropHandler *v6;

  v4 = a3;
  +[Application sharedApplication](Application, "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TabDocumentDropHandler initWithMaximumNumberOfTabs:alertPresentationViewController:](self, "initWithMaximumNumberOfTabs:alertPresentationViewController:", objc_msgSend(v5, "maximumTabCount"), v4);

  return v6;
}

- (TabDocumentDropHandler)initWithMaximumNumberOfTabs:(unint64_t)a3 alertPresentationViewController:(id)a4
{
  id v6;
  TabDocumentDropHandler *v7;
  TabDocumentDropHandler *v8;
  TabDocumentDropHandler *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TabDocumentDropHandler;
  v7 = -[TabDocumentDropHandler init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_maximumNumberOfTabs = a3;
    objc_storeWeak((id *)&v7->_alertPresentationViewController, v6);
    v9 = v8;
  }

  return v8;
}

- (TabDocumentDropHandler)init
{
  return -[TabDocumentDropHandler initWithAlertPresentationViewController:](self, "initWithAlertPresentationViewController:", 0);
}

- (void)dropItemsForSession:(id)a3 withInsertionHandler:(id)a4
{
  -[TabDocumentDropHandler dropItemsForSession:withInsertionHandler:completionHandler:](self, "dropItemsForSession:withInsertionHandler:completionHandler:", a3, a4, 0);
}

- (void)dropItemsForSession:(id)a3 withInsertionHandler:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v27 = a4;
  v26 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v29 = v7;
  objc_msgSend(v7, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v37;
    v30 = *(_QWORD *)v37;
    v31 = v9;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v15, "safari_localTab");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v8, "addObject:", v15);
        }
        else
        {
          objc_msgSend(v15, "_sf_localBookmark");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "isFolder"))
          {
            v18 = v12;
            objc_msgSend(MEMORY[0x1E0DCCBA0], "safariBookmarkCollection");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "descendantsOfBookmarkFolder:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "count");

            if (v21)
            {
              v22 = v21;
              v12 = v18;
              do
              {
                objc_msgSend(v8, "addObject:", v15);
                --v22;
              }
              while (v22);
            }
            else
            {
              v12 = v18;
            }
            v13 = v30;
            v9 = v31;
          }
          else
          {
            objc_msgSend(v8, "addObject:", v15);
            v21 = 1;
          }
          v12 += v21;

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __85__TabDocumentDropHandler_dropItemsForSession_withInsertionHandler_completionHandler___block_invoke;
  v32[3] = &unk_1E9CF9AA8;
  v34 = v26;
  v35 = v27;
  v33 = v8;
  v23 = v8;
  v24 = v27;
  v25 = v26;
  -[TabDocumentDropHandler promptIfNeededToConfirmNumberOfNavigationIntents:withCompletionHandler:](self, "promptIfNeededToConfirmNumberOfNavigationIntents:withCompletionHandler:", v12, v32);

}

uint64_t __85__TabDocumentDropHandler_dropItemsForSession_withInsertionHandler_completionHandler___block_invoke(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)promptIfNeededToConfirmNumberOfNavigationIntents:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertPresentationViewController);
  if (WeakRetained
    && -[TabDocumentDropHandler _minimumNumberOfNewTabsRequiringConfirmation](self, "_minimumNumberOfNewTabsRequiringConfirmation") <= a3)
  {
    if (a3 == 1)
    {
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v11, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v13, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, v8, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC3448];
    v16 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __97__TabDocumentDropHandler_promptIfNeededToConfirmNumberOfNavigationIntents_withCompletionHandler___block_invoke;
    v24[3] = &unk_1E9CF8360;
    v17 = v6;
    v25 = v17;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v9, 0, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __97__TabDocumentDropHandler_promptIfNeededToConfirmNumberOfNavigationIntents_withCompletionHandler___block_invoke_2;
    v22[3] = &unk_1E9CF8360;
    v23 = v17;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addAction:", v18);
    objc_msgSend(v14, "addAction:", v21);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v14, 1, 0);

  }
  else
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

uint64_t __97__TabDocumentDropHandler_promptIfNeededToConfirmNumberOfNavigationIntents_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __97__TabDocumentDropHandler_promptIfNeededToConfirmNumberOfNavigationIntents_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)_minimumNumberOfNewTabsRequiringConfirmation
{
  unint64_t maximumNumberOfTabs;
  unint64_t v3;

  maximumNumberOfTabs = self->_maximumNumberOfTabs;
  v3 = 50;
  if (maximumNumberOfTabs < 0x32)
    v3 = 20;
  if (maximumNumberOfTabs >= 0xA)
    return v3;
  else
    return 2;
}

+ (unint64_t)proposedOperationForSession:(id)a3 intoWindowWithPrivateBrowsingEnabled:(BOOL)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v11[5];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__TabDocumentDropHandler_proposedOperationForSession_intoWindowWithPrivateBrowsingEnabled___block_invoke;
  v11[3] = &unk_1E9CF9AD0;
  v11[4] = &v13;
  v12 = a4;
  v7 = objc_msgSend(v6, "safari_containsObjectPassingTest:", v11);

  v8 = 2;
  if (!v7)
    v8 = 3;
  if (*((_BYTE *)v14 + 24))
    v9 = 1;
  else
    v9 = v8;
  _Block_object_dispose(&v13, 8);

  return v9;
}

BOOL __91__TabDocumentDropHandler_proposedOperationForSession_intoWindowWithPrivateBrowsingEnabled___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "safari_localWBTab");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(unsigned __int8 *)(a1 + 40) != objc_msgSend(v3, "isPrivateBrowsing");

  return v4 == 0;
}

+ (BOOL)canHandleSession:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D4EF70], "canCreateNavigationIntentForDropSession:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "tabsForDragItems:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "count") != 0;

  }
  return v5;
}

+ (BOOL)canPinAllItemsInSession:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a3, "localDragSession", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "safari_localWBTab");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "safari_localBrowserController");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v10)
          v13 = v11 == 0;
        else
          v13 = 1;
        if (!v13 && !objc_msgSend(v9, "safari_localTabIsPinnable"))
        {

          v14 = 0;
          goto LABEL_15;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_15:

  return v14;
}

+ (BOOL)canAddTab:(id)a3 toSessionWithDragItems:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  int v9;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "canSetPinned") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    +[TabDocumentDropHandler commonPinnedStateForDragItems:](TabDocumentDropHandler, "commonPinnedStateForDragItems:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (v8)
    {
      v9 = objc_msgSend(v5, "isPinned");
      if (v9 == objc_msgSend(v8, "BOOLValue"))
        v7 = 1;
    }

  }
  return v7;
}

+ (id)commonPinnedStateForDragItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unsigned int v11;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "safari_localWBTab");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isPinned");
        v6 += v11 ^ 1;
        v7 += v11;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
    if (v7 >= 1 && v6 == 0)
    {
      v13 = (void *)MEMORY[0x1E0C9AAB0];
      goto LABEL_21;
    }
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  if (v7)
    v14 = 1;
  else
    v14 = v6 <= -1;
  if (v14)
    v13 = 0;
  else
    v13 = (void *)MEMORY[0x1E0C9AAA0];
LABEL_21:

  return v13;
}

+ (id)tabsForDragItems:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_53);
}

uint64_t __43__TabDocumentDropHandler_tabsForDragItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_localTab");
}

- (unint64_t)maximumNumberOfTabs
{
  return self->_maximumNumberOfTabs;
}

- (UIViewController)alertPresentationViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_alertPresentationViewController);
}

- (void)setAlertPresentationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_alertPresentationViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertPresentationViewController);
}

@end
