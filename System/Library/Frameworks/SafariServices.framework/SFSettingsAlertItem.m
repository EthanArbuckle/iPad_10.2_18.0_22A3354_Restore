@implementation SFSettingsAlertItem

id __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;
  _QWORD v19[4];
  id v20;
  id v21;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "attributedStringForValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textStyleForValue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke_2;
  v19[3] = &unk_1E4AC4B88;
  v20 = *(id *)(a1 + 32);
  v9 = v3;
  v21 = v9;
  +[_SFSettingsAlertItem optionGroupOptionWithAttributedTitle:textStyle:icon:action:handler:](_SFSettingsAlertItem, "optionGroupOptionWithAttributedTitle:textStyle:icon:action:handler:", v4, v5, v7, v6, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setTintColor:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessibilityIdentifierForValue:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", v11);

  }
  objc_initWeak(&location, v10);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke_3;
  v14[3] = &unk_1E4AC4BB0;
  objc_copyWeak(&v17, &location);
  v15 = *(id *)(a1 + 32);
  v12 = v9;
  v16 = v12;
  objc_msgSend(v10, "setViewConfigurationBlock:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v10;
}

void __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(*(id *)(a1 + 32), "shouldSelectValue:forItem:groupItem:", *(_QWORD *)(a1 + 40), v4, v5))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v5, "subItems", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "setSelected:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) == (_QWORD)v4);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    objc_msgSend(*(id *)(a1 + 32), "setSelectedValue:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(v5, "updateOptionsGroupDetailLabel");

}

void __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setSelected:", objc_msgSend(*(id *)(a1 + 32), "isSelectedValue:", *(_QWORD *)(a1 + 40)));
    objc_msgSend(*(id *)(a1 + 32), "prepareView:forItem:value:", v4, WeakRetained, *(_QWORD *)(a1 + 40));
  }

}

uint64_t __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_pushSubItemsForGroup:");
}

uint64_t __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setComponentsArrangement:", &unk_1E4B272E0);
}

uint64_t __53___SFSettingsAlertItem_updateOptionsGroupDetailLabel__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isSelectedValue:", a2);
}

void __72___SFSettingsAlertItem_setUpSelectionHandlerIfNeededWithViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3)
    {
      objc_msgSend(v6, "handler");
      v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, void *))v4)[2](v4, v3, v5);

    }
    WeakRetained = v6;
  }

}

@end
