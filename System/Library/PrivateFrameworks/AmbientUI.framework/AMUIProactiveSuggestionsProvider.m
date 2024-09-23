@implementation AMUIProactiveSuggestionsProvider

- (AMUIProactiveSuggestionsProvider)initWithIconListModel:(id)a3 iconManager:(id)a4 proactiveClient:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMUIProactiveSuggestionsProvider *v12;
  AMUIProactiveSuggestionsProvider *v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AMUIProactiveSuggestionsProvider;
  v12 = -[AMUIProactiveSuggestionsProvider init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_proactiveClient, a5);
    -[ATXAmbientSuggestionProvider setDelegate:](v13->_proactiveClient, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_iconListModel, a3);
    objc_storeStrong((id *)&v13->_iconManager, a4);
    -[ATXAmbientSuggestionProvider stackSuggestions](v13->_proactiveClient, "stackSuggestions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIProactiveSuggestionsProvider processUpdatedPredictions:](v13, "processUpdatedPredictions:", v14);

  }
  return v13;
}

- (void)suggestionProvider:(id)a3 didUpdateStackSuggestions:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__AMUIProactiveSuggestionsProvider_suggestionProvider_didUpdateStackSuggestions___block_invoke;
  v7[3] = &unk_250763400;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __81__AMUIProactiveSuggestionsProvider_suggestionProvider_didUpdateStackSuggestions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processUpdatedPredictions:", *(_QWORD *)(a1 + 40));
}

- (id)suggestionForStackIdentifier:(id)a3 amongSuggestions:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "stackIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)processUpdatedPredictions:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  id obj;
  id v21;
  _QWORD v22[4];
  id v23;
  AMUIProactiveSuggestionsProvider *v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  AMUILogProactive();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23600A000, v4, OS_LOG_TYPE_DEFAULT, "Updating stack predictions", buf, 2u);
  }

  -[AMUIProactiveSuggestionsProvider currentPredictions](self, "currentPredictions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIProactiveSuggestionsProvider setCurrentPredictions:](self, "setCurrentPredictions:", v21);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[SBIconListModel iconsOfClass:](self->_iconListModel, "iconsOfClass:", objc_opt_class());
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v29;
    *(_QWORD *)&v7 = 138412546;
    v19 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "uniqueIdentifier", v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMUIProactiveSuggestionsProvider suggestionForStackIdentifier:amongSuggestions:](self, "suggestionForStackIdentifier:amongSuggestions:", v12, v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[AMUIProactiveSuggestionsProvider suggestionForStackIdentifier:amongSuggestions:](self, "suggestionForStackIdentifier:amongSuggestions:", v12, v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        AMUILogProactive();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v19;
          v33 = v13;
          v34 = 2112;
          v35 = v12;
          _os_log_impl(&dword_23600A000, v15, OS_LOG_TYPE_DEFAULT, "Suggestion %@ for stack with identifier: %@", buf, 0x16u);
        }

        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke;
        v22[3] = &unk_2507636C8;
        v23 = v13;
        v24 = self;
        v25 = v11;
        v26 = v12;
        v27 = v14;
        v16 = v14;
        v17 = v12;
        v18 = v13;
        objc_msgSend(v11, "performCoalescedDataSourceUpdate:", v22);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v8);
  }

}

void __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke(uint64_t a1)
{
  __int128 v2;
  uint64_t i;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  __int128 v34;
  id obj;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  NSObject *v46;
  __int16 v47;
  NSObject *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v36 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "suggestedWidgets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v42;
    *(_QWORD *)&v2 = 138412290;
    v34 = v2;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v42 != v37)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v5 = *(void **)(a1 + 40);
        v6 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v4, "identifier", v34);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "chsWidget");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "extensionBundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "chsWidget");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "kind");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_iconDataSourceInIcon:withUniqueIdentifier:extensionBundleIdentifier:widgetKind:suggestionSource:", v6, v7, v9, v11, 1);
        v12 = objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          AMUILogProactive();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v34;
            v46 = v12;
            _os_log_impl(&dword_23600A000, v13, OS_LOG_TYPE_DEFAULT, "Skipping adding data source because the suggested widget %@ is already suggested in stack", buf, 0xCu);
          }

          objc_msgSend(v36, "addObject:", v12);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "_makeDataSourceForAtxWidget:", v4);
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            AMUILogProactive();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v34;
              v46 = v14;
              _os_log_impl(&dword_23600A000, v15, OS_LOG_TYPE_DEFAULT, "Adding new suggested widget data source %@", buf, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 40), "delegate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = *(_QWORD *)(a1 + 40);
            objc_msgSend(v4, "chsWidget");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "intent");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = *(_QWORD *)(a1 + 56);
            objc_msgSend(v4, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "proactiveSuggestionsProvider:willUseIntent:forIconWithIdentifier:widgetUniqueIdentifier:", v17, v19, v20, v21);

            v22 = objc_msgSend(*(id *)(a1 + 48), "allowsSuggestions");
            v23 = *(void **)(a1 + 48);
            if (v22)
            {
              objc_msgSend(v23, "addIconDataSource:", v14);
            }
            else
            {
              objc_msgSend(v23, "activeDataSource");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 48), "insertIconDataSource:beforeIconDataSource:", v14, v24);

            }
            objc_msgSend(v36, "addObject:", v14);
          }

        }
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v38);
  }

  v25 = *(void **)(a1 + 48);
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke_7;
  v39[3] = &unk_2507636A0;
  v26 = v36;
  v40 = v26;
  objc_msgSend(v25, "removeIconDataSourcesPassingTest:", v39);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "isShowingModalInteraction"))
  {
    AMUILogProactive();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke_cold_1(v27);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "topWidgetIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(*(id *)(a1 + 32), "topWidgetIdentifier");
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "topWidgetIdentifier");
      v29 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqual:](v27, "isEqual:", v29))
      {
        AMUILogProactive();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v29;
          v47 = 2112;
          v48 = v27;
          _os_log_impl(&dword_23600A000, v30, OS_LOG_TYPE_DEFAULT, "Skipping active data source update because the old top widget (%@) we had was the same as the new one (%@)", buf, 0x16u);
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "firstIconDataSourceWithUniqueIdentifier:", v27);
        v30 = objc_claimAutoreleasedReturnValue();
        AMUILogProactive();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v30)
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 48), "activeDataSource");
            v33 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v46 = v30;
            v47 = 2112;
            v48 = v33;
            _os_log_impl(&dword_23600A000, v32, OS_LOG_TYPE_DEFAULT, "Setting active data source to widget %@ (previously: %@)", buf, 0x16u);

          }
          objc_msgSend(*(id *)(a1 + 48), "setStackChangeReason:", 2);
          objc_msgSend(*(id *)(a1 + 48), "setActiveDataSource:", v30);
        }
        else
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke_cold_2((uint64_t)v27, v32);

        }
      }

    }
    else
    {
      AMUILogProactive();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23600A000, v27, OS_LOG_TYPE_DEFAULT, "Skipping active data source update because suggested top widget is nil", buf, 2u);
      }
    }
  }

}

uint64_t __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v3, "suggestionSource") == 1
    && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    AMUILogProactive();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_23600A000, v6, OS_LOG_TYPE_DEFAULT, "Removing suggested widget data source %@ because it's no longer suggested", (uint8_t *)&v7, 0xCu);
    }

    v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_iconDataSourceInIcon:(id)a3 withUniqueIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 widgetKind:(id)a6 suggestionSource:(int64_t)a7
{
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  int64_t v18;

  v11 = a5;
  v12 = a6;
  if (a4)
  {
    objc_msgSend(a3, "firstIconDataSourceWithUniqueIdentifier:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __133__AMUIProactiveSuggestionsProvider__iconDataSourceInIcon_withUniqueIdentifier_extensionBundleIdentifier_widgetKind_suggestionSource___block_invoke;
    v15[3] = &unk_2507636F0;
    v18 = a7;
    v16 = v11;
    v17 = v12;
    objc_msgSend(a3, "firstWidgetPassingTest:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

uint64_t __133__AMUIProactiveSuggestionsProvider__iconDataSourceInIcon_withUniqueIdentifier_extensionBundleIdentifier_widgetKind_suggestionSource___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = v3;
  if (a1[6] && objc_msgSend(v3, "suggestionSource") != a1[6])
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "extensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", a1[4]))
    {
      v7 = a1[5];
      v6 = a1 + 5;
      if (v7)
      {
        objc_msgSend(v4, "kind");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", *v6);

      }
      else
      {
        v9 = 1;
      }
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)_makeDataSourceForAtxWidget:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (objc_class *)MEMORY[0x24BEB0920];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chsWidget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chsWidget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extensionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chsWidget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "containerBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v5, "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:", v6, v8, v10, v12);

  v14 = (void *)objc_msgSend(v13, "copyWithSuggestionSource:", 1);
  return v14;
}

- (NSArray)currentPredictions
{
  return self->_currentPredictions;
}

- (void)setCurrentPredictions:(id)a3
{
  objc_storeStrong((id *)&self->_currentPredictions, a3);
}

- (AMUIProactiveSuggestionsProviderDelegate)delegate
{
  return (AMUIProactiveSuggestionsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentPredictions, 0);
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_iconListModel, 0);
  objc_storeStrong((id *)&self->_proactiveClient, 0);
}

void __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23600A000, log, OS_LOG_TYPE_ERROR, "Skipping active data source update because configuration UI is showing", v1, 2u);
}

void __62__AMUIProactiveSuggestionsProvider_processUpdatedPredictions___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23600A000, a2, OS_LOG_TYPE_ERROR, "Suggested top widget not found in stack for widget identifier: %@", (uint8_t *)&v2, 0xCu);
}

@end
