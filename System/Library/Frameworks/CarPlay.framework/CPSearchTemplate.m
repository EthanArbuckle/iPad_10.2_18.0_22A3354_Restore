@implementation CPSearchTemplate

- (CPSearchTemplate)searchTemplateWithIdentifier:(id)a3 updateSearchResultsForSearchText:(id)a4 completionResults:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  CPSearchTemplate *result;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id location;

  v7 = a4;
  v8 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__CPSearchTemplate_searchTemplateWithIdentifier_updateSearchResultsForSearchText_completionResults___block_invoke;
  block[3] = &unk_24C77DA70;
  block[4] = self;
  v13 = v7;
  v9 = v7;
  objc_copyWeak(&v15, &location);
  v14 = v8;
  v10 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return result;
}

void __100__CPSearchTemplate_searchTemplateWithIdentifier_updateSearchResultsForSearchText_completionResults___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __100__CPSearchTemplate_searchTemplateWithIdentifier_updateSearchResultsForSearchText_completionResults___block_invoke_2;
    v7[3] = &unk_24C77DA48;
    objc_copyWeak(&v9, (id *)(a1 + 56));
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v4, "searchTemplate:updatedSearchText:completionHandler:", v5, v6, v7);

    objc_destroyWeak(&v9);
  }
}

void __100__CPSearchTemplate_searchTemplateWithIdentifier_updateSearchResultsForSearchText_completionResults___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setListItems:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (CPSearchTemplate)searchTemplateWithIdentifier:(id)a3 selectedResultWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  CPSearchTemplate *result;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__CPSearchTemplate_searchTemplateWithIdentifier_selectedResultWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24C77D5C8;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  return result;
}

void __96__CPSearchTemplate_searchTemplateWithIdentifier_selectedResultWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "listItems", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_2549DAC20))
        {
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }

        if ((objc_msgSend(*(id *)(a1 + 40), "isEqual:", v10) & 1) != 0)
          break;

        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v6)
            goto LABEL_4;
          goto LABEL_13;
        }
      }
      v11 = v9;

      if (!v11)
        goto LABEL_16;
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "searchTemplate:selectedResult:completionHandler:", *(_QWORD *)(a1 + 32), v11, *(_QWORD *)(a1 + 48));

    }
    else
    {
LABEL_13:

LABEL_16:
      CarPlayFrameworkGeneralLogging();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __96__CPSearchTemplate_searchTemplateWithIdentifier_selectedResultWithIdentifier_completionHandler___block_invoke_cold_1(a1, v11);
    }

  }
}

- (void)searchTemplateSearchButtonPressedWithIdentifier:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  CPSearchTemplate *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  CarPlayFrameworkGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_20D6F4000, v4, OS_LOG_TYPE_DEFAULT, "Search template search button pressed: %{public}@", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__CPSearchTemplate_searchTemplateSearchButtonPressedWithIdentifier___block_invoke;
  block[3] = &unk_24C77C5B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __68__CPSearchTemplate_searchTemplateSearchButtonPressedWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  CarPlayFrameworkGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "Search Template Delegate will handle search button pressed", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject searchTemplateSearchButtonPressed:](v5, "searchTemplateSearchButtonPressed:", *(_QWORD *)(a1 + 32));
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __68__CPSearchTemplate_searchTemplateSearchButtonPressedWithIdentifier___block_invoke_cold_1(v5);
  }

}

- (id)leadingNavigationBarButtons
{
  -[CPSearchTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setLeadingNavigationBarButtons:(id)a3
{
  -[CPSearchTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)trailingNavigationBarButtons
{
  -[CPSearchTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setTrailingNavigationBarButtons:(id)a3
{
  -[CPSearchTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (NSArray)listItems
{
  return self->_listItems;
}

- (void)setListItems:(id)a3
{
  objc_storeStrong((id *)&self->_listItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __96__CPSearchTemplate_searchTemplateWithIdentifier_selectedResultWithIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_20D6F4000, a2, OS_LOG_TYPE_ERROR, "Failed to find a local item for %@", (uint8_t *)&v3, 0xCu);
}

void __68__CPSearchTemplate_searchTemplateSearchButtonPressedWithIdentifier___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D6F4000, log, OS_LOG_TYPE_ERROR, "Search Template Delegate does not handle search button pressed", v1, 2u);
}

@end
