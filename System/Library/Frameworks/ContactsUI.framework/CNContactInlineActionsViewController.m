@implementation CNContactInlineActionsViewController

- (CNContact)contact
{
  void *v3;
  void *v4;
  void *v5;

  -[CNContactInlineActionsViewController contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    v5 = 0;
  }
  else
  {
    -[CNContactInlineActionsViewController contacts](self, "contacts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (CNContact *)v5;
}

- (NSArray)contacts
{
  return self->_contacts;
}

id __59__CNContactInlineActionsViewController_allModelsObservable__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (void)setPosterTintColor:(id)a3
{
  void *v5;
  UIColor *v6;

  v6 = (UIColor *)a3;
  if (self->_posterTintColor != v6)
  {
    objc_storeStrong((id *)&self->_posterTintColor, a3);
    -[CNContactInlineActionsViewController actionsView](self, "actionsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPosterTintColor:", v6);

  }
}

- (void)setViewStyle:(int64_t)a3
{
  id v4;

  self->_viewStyle = a3;
  -[CNContactInlineActionsViewController actionsView](self, "actionsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyle:", a3);

}

id __59__CNContactInlineActionsViewController_allModelsObservable__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = a2;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a2;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __72__CNContactInlineActionsViewController_displayAllSupportedTypesDisabled__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D13D90], "emptyModel");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactInlineActionsViewController;
  -[CNContactInlineActionsViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[CNContactInlineActionsViewController updateDesiredTitleFontSizeIfNeeded](self, "updateDesiredTitleFontSizeIfNeeded");
  -[CNContactInlineActionsViewController actionItems](self, "actionItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactInlineActionsViewController displayAdditionalActionItems:](self, "displayAdditionalActionItems:", v3);

}

id __59__CNContactInlineActionsViewController_allModelsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "actionListDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "consumer:actionModelsForContact:actionType:", 0, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__CNContactInlineActionsViewController_allModelsObservable__block_invoke_2;
  v10[3] = &unk_1E204F4A0;
  v11 = v3;
  v7 = v3;
  objc_msgSend(v6, "map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __57__CNContactInlineActionsViewController_loadCachedActions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "actionListDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "consumer:currentActionModelForContact:actionType:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13D90], "emptyModel");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

__CFString *__74__CNContactInlineActionsViewController_updateDesiredTitleFontSizeIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "actionListDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "consumer:localizedButtonDisplayNameForActionType:", *(_QWORD *)(a1 + 32), v4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = &stru_1E20507A8;
  v8 = v7;

  return v8;
}

- (void)updateDesiredTitleFontSizeIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  _QWORD v24[5];
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[CNContactInlineActionsViewController actionsView](self, "actionsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[CNContactInlineActionsViewController actionsView](self, "actionsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (-[CNContactInlineActionsViewController displaysTitles](self, "displaysTitles")
        && -[CNContactInlineActionsViewController displaysUnavailableActionTypes](self, "displaysUnavailableActionTypes")&& (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
      {
        -[CNContactInlineActionsViewController supportedActionTypes](self, "supportedActionTypes");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __74__CNContactInlineActionsViewController_updateDesiredTitleFontSizeIfNeeded__block_invoke;
        v24[3] = &unk_1E204F410;
        v24[4] = self;
        objc_msgSend(v6, "_cn_map:", v24);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D13B90], "LongestString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_cn_reduce:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bounds");
        if (v11 <= 320.0)
          v12 = 46.0;
        else
          v12 = 66.0;

        +[CNActionView defaultTitleFont](CNActionView, "defaultTitleFont");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *MEMORY[0x1E0DC1138];
        v27 = *MEMORY[0x1E0DC1138];
        +[CNActionView defaultTitleFont](CNActionView, "defaultTitleFont");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 0, v16, 0, 1.79769313e308, 1.79769313e308);
        v18 = v17;

        if (v12 < v18)
        {
          objc_msgSend(v13, "fontWithSize:", 12.0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v14;
          v26 = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 0, v20, 0, 1.79769313e308, 1.79769313e308);
          v22 = v21;

          if (v12 >= v22)
          {
            v13 = v19;
          }
          else
          {
            objc_msgSend(v19, "fontWithSize:", 10.0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        -[CNContactInlineActionsViewController actionsView](self, "actionsView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTitleFont:", v13);

      }
    }
  }
}

void __65__CNContactInlineActionsViewController_updateVisibleActionItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "actionsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateActionItem:", v3);

}

void __69__CNContactInlineActionsViewController_displayAdditionalActionItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "actionsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addActionItem:", v3);

}

void __54__CNContactInlineActionsViewController_processModels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = a3;
  objc_msgSend(v5, "defaultAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v18);

  v7 = objc_msgSend(v5, "isEmpty");
  v8 = *(void **)(a1 + 40);
  if (!v7)
  {
    objc_msgSend(v5, "defaultAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayActionForType:withDefaultAction:enabled:", v18, v11, 1);

    objc_msgSend(*(id *)(a1 + 40), "environment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "launchCheckinRegistrar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v18, "isEqual:", *MEMORY[0x1E0C96620]) & 1) != 0)
    {
      v14 = 16;
    }
    else if ((objc_msgSend(v18, "isEqual:", *MEMORY[0x1E0C96618]) & 1) != 0)
    {
      v14 = 32;
    }
    else
    {
      if (!objc_msgSend(v18, "isEqual:", *MEMORY[0x1E0C965F8]))
      {
LABEL_12:

        goto LABEL_13;
      }
      v14 = 8;
    }
    objc_msgSend(v13, "checkInLaunchTasks:", v14);
    goto LABEL_12;
  }
  v9 = objc_msgSend(*(id *)(a1 + 40), "displaysUnavailableActionTypes");
  v10 = *(void **)(a1 + 40);
  if (v9)
    objc_msgSend(v10, "displayActionForType:withDefaultAction:enabled:", v18, 0, 0);
  else
    objc_msgSend(v10, "removeActionForType:", v18);
LABEL_13:
  objc_msgSend(v5, "defaultAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "actionsView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionViewForType:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShowsMenuAsPrimaryAction:", v15 == 0);

}

- (CNActionsView)actionsView
{
  return (CNActionsView *)objc_loadWeakRetained((id *)&self->_actionsView);
}

- (BOOL)displaysUnavailableActionTypes
{
  return self->_displaysUnavailableActionTypes;
}

- (void)displayActionForType:(id)a3 withDefaultAction:(id)a4 enabled:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v5 = a5;
  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[CNContactInlineActionsViewController existingActionItemForType:](self, "existingActionItemForType:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v10)
  {
    -[CNContactInlineActionsViewController makeActionItemForType:](self, "makeActionItemForType:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "setDisabled:", !v5);
  -[CNContactInlineActionsViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactInlineActionsViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[CNContactInlineActionsViewController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "contactInlineActionsViewController:shouldOverrideEnabledStateForActionOfType:", self, v8);

      if (v16)
      {
        -[CNContactInlineActionsViewController delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "contactInlineActionsViewController:overrideEnabledStateForActionOfType:", self, v8);

        objc_msgSend(v11, "setDisabled:", v18 ^ 1u);
      }
    }
  }
  else
  {

  }
  -[CNContactInlineActionsViewController updateActionItem:withDefaultAction:](self, "updateActionItem:withDefaultAction:", v11, v9);
  if (v10)
  {
    v23[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController updateVisibleActionItems:](self, "updateVisibleActionItems:", v19);
  }
  else
  {
    -[CNContactInlineActionsViewController actionItems](self, "actionItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayByAddingObject:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController setActionItems:](self, "setActionItems:", v21);

    v22 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController displayAdditionalActionItems:](self, "displayAdditionalActionItems:", v19);
  }

}

- (CNContactInlineActionsViewControllerDelegate)delegate
{
  return (CNContactInlineActionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)updateActionItem:(id)a3 withDefaultAction:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (-[CNContactInlineActionsViewController displaysTitles](self, "displaysTitles"))
  {
    -[CNContactInlineActionsViewController actionListDataSource](self, "actionListDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "type");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "consumer:localizedDisplayNameForButtonWithDefaultAction:actionType:", self, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setTitle:", v9);
    -[CNContactInlineActionsViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[CNContactInlineActionsViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contactInlineActionsViewController:overrideTitleForActionOfType:", self, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        objc_msgSend(v14, "setTitle:", v13);

    }
  }

}

uint64_t __66__CNContactInlineActionsViewController_existingActionItemForType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (CNUIUserActionListDataSource)actionListDataSource
{
  return self->_actionListDataSource;
}

- (BOOL)displaysTitles
{
  return self->_displaysTitles;
}

- (id)existingActionItemForType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CNContactInlineActionsViewController actionItems](self, "actionItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__CNContactInlineActionsViewController_existingActionItemForType___block_invoke;
  v9[3] = &unk_1E204F5F8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "_cn_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)actionItems
{
  return self->_actionItems;
}

- (void)setActionItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void)displayAdditionalActionItems:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__CNContactInlineActionsViewController_displayAdditionalActionItems___block_invoke;
  v3[3] = &unk_1E204F478;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (void)updateVisibleActionItems:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__CNContactInlineActionsViewController_updateVisibleActionItems___block_invoke;
  v3[3] = &unk_1E204F478;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (id)makeActionItemForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CNActionItem *v13;

  v4 = a3;
  -[CNContactInlineActionsViewController actionImageTextStyleForViewStyle:](self, "actionImageTextStyleForViewStyle:", -[CNContactInlineActionsViewController viewStyle](self, "viewStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "cnui_userActionSymbolImageForActionType:scale:withColor:compatibleWithTextStyle:", v4, -1, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactInlineActionsViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNContactInlineActionsViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contactInlineActionsViewController:overrideImageForActionOfType:", self, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = v10;
    else
      v11 = v6;
    v12 = v11;

    v6 = v12;
  }
  v13 = -[CNActionItem initWithImage:type:]([CNActionItem alloc], "initWithImage:type:", v6, v4);

  return v13;
}

- (int64_t)viewStyle
{
  return self->_viewStyle;
}

- (id)actionImageTextStyleForViewStyle:(int64_t)a3
{
  id *v3;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
    v3 = (id *)MEMORY[0x1E0DC4B60];
  else
    v3 = (id *)MEMORY[0x1E0DC4A88];
  return *v3;
}

- (BOOL)shouldShowDisambiguationForAction:(id)a3
{
  id v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[CNContactInlineActionsViewController isGroupActionsView](self, "isGroupActionsView"))
  {
    v5 = 0;
  }
  else
  {
    -[CNContactInlineActionsViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CNContactInlineActionsViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "type");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "contactInlineActionsViewController:shouldPresentDisambiguationUIForActionOfType:", self, v9);

    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

- (BOOL)isGroupActionsView
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CNContactInlineActionsViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[CNContactInlineActionsViewController contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (unint64_t)objc_msgSend(v5, "count") > 1;

  }
  return v4;
}

- (BOOL)actionsView:(id)a3 shouldPresentDisambiguationUIForAction:(id)a4
{
  return -[CNContactInlineActionsViewController shouldShowDisambiguationForAction:](self, "shouldShowDisambiguationForAction:", a4);
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setObjectViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->objectViewControllerDelegate, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSupportedActionTypes:(id)a3
{
  char v4;
  void *v5;
  NSArray *v6;
  NSArray *supportedActionTypes;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = objc_msgSend(v18, "isEqual:", self->_supportedActionTypes);
  v5 = v18;
  if ((v4 & 1) == 0)
  {
    v6 = (NSArray *)objc_msgSend(v18, "copy");
    supportedActionTypes = self->_supportedActionTypes;
    self->_supportedActionTypes = v6;

    -[CNContactInlineActionsViewController reset](self, "reset");
    -[CNContactInlineActionsViewController supportedActionTypes](self, "supportedActionTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 0;
    -[CNContactInlineActionsViewController actionsView](self, "actionsView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", v9);

    -[CNContactInlineActionsViewController actionsView](self, "actionsView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSortedActionTypes:", v18);

    if (-[CNContactInlineActionsViewController displaysUnavailableActionTypes](self, "displaysUnavailableActionTypes"))
      -[CNContactInlineActionsViewController displayAllSupportedTypesDisabled](self, "displayAllSupportedTypesDisabled");
    -[CNContactInlineActionsViewController contact](self, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDebugDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactInlineActionsViewController.m", 260, 7, CFSTR("%@ just got new supportedActionTypes, contact is %@. Will discover action types…"), v13, v14, v15, v16, (uint64_t)self);

    -[CNContactInlineActionsViewController discoverAvailableActionTypes](self, "discoverAvailableActionTypes");
    v5 = v18;
  }

}

- (void)setDisplaysUnavailableActionTypes:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  -[CNContactInlineActionsViewController contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("You must call %@ before a contact is set"), v9);

  }
  self->_displaysUnavailableActionTypes = v3;
  if (v3)
  {
    -[CNContactInlineActionsViewController updateDesiredTitleFontSizeIfNeeded](self, "updateDesiredTitleFontSizeIfNeeded");
    -[CNContactInlineActionsViewController displayAllSupportedTypesDisabled](self, "displayAllSupportedTypesDisabled");
  }
}

- (void)setDisplaysTitles:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  -[CNContactInlineActionsViewController contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("You must call %@ before a contact is set"), v9);

  }
  if (self->_displaysTitles != v3)
  {
    self->_displaysTitles = v3;
    -[CNContactInlineActionsViewController updateDesiredTitleFontSizeIfNeeded](self, "updateDesiredTitleFontSizeIfNeeded");
  }
}

- (CNContactInlineActionsViewController)initWithActionListDataSource:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  CNContactInlineActionsViewController *v9;
  CNContactInlineActionsViewController *v10;
  void *v11;
  uint64_t v12;
  NSArray *supportedActionTypes;
  NSArray *actionItems;
  NSArray *v15;
  NSArray *tokens;
  NSDictionary *defaultActionPerType;
  int v18;
  double v19;
  uint64_t v20;
  CNSchedulerProvider *schedulerProvider;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CNContactInlineActionsViewController;
  v9 = -[CNContactInlineActionsViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionListDataSource, a3);
    objc_msgSend(MEMORY[0x1E0D13D88], "allSupportedActionTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    supportedActionTypes = v10->_supportedActionTypes;
    v10->_supportedActionTypes = (NSArray *)v12;

    actionItems = v10->_actionItems;
    v15 = (NSArray *)MEMORY[0x1E0C9AA60];
    v10->_actionItems = (NSArray *)MEMORY[0x1E0C9AA60];

    tokens = v10->_tokens;
    v10->_tokens = v15;

    defaultActionPerType = v10->_defaultActionPerType;
    v10->_defaultActionPerType = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v18 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    v19 = 8.0;
    if (v18)
      v19 = 16.0;
    v10->_actionTypesInterspace = v19;
    v10->_displaysUnavailableActionTypes = 0;
    v10->_displaysTitles = 0;
    objc_msgSend(v8, "defaultSchedulerProvider");
    v20 = objc_claimAutoreleasedReturnValue();
    schedulerProvider = v10->_schedulerProvider;
    v10->_schedulerProvider = (CNSchedulerProvider *)v20;

    objc_storeStrong((id *)&v10->_environment, a4);
  }

  return v10;
}

- (void)setContact:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[CNContactInlineActionsViewController setContacts:](self, "setContacts:", v6, v7, v8);

}

- (void)setContacts:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_contacts != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contacts, a3);
    if (-[NSArray count](v6, "count") < 2)
      -[CNContactInlineActionsViewController setupSingleContactActions](self, "setupSingleContactActions");
    else
      -[CNContactInlineActionsViewController setupGroupActions](self, "setupGroupActions");
    v5 = v6;
  }

}

- (void)setupSingleContactActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[CNContactInlineActionsViewController reset](self, "reset");
  if (-[CNContactInlineActionsViewController displaysUnavailableActionTypes](self, "displaysUnavailableActionTypes"))
    -[CNContactInlineActionsViewController displayAllSupportedTypesDisabled](self, "displayAllSupportedTypesDisabled");
  -[CNContactInlineActionsViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortDebugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactInlineActionsViewController actionListDataSource](self, "actionListDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactInlineActionsViewController.m", 215, 7, CFSTR("%@ just got new contact %@, dataSource is %@. Will discover action types…"), v5, v6, v7, v8, (uint64_t)self);

  -[CNContactInlineActionsViewController loadCachedActions](self, "loadCachedActions");
  -[CNContactInlineActionsViewController discoverAvailableActionTypes](self, "discoverAvailableActionTypes");
  -[CNContactInlineActionsViewController contact](self, "contact");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactInlineActionsViewController checkinLaunchTasksForUndiscoverableActionsForContact:](self, "checkinLaunchTasksForUndiscoverableActionsForContact:", v10);

}

- (void)reset
{
  void *v3;
  char v4;
  void *v5;

  -[CNContactInlineActionsViewController actionItems](self, "actionItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", MEMORY[0x1E0C9AA60]);

  if ((v4 & 1) == 0)
  {
    -[CNContactInlineActionsViewController actionsView](self, "actionsView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetActions");

    -[CNContactInlineActionsViewController setActionItems:](self, "setActionItems:", MEMORY[0x1E0C9AA60]);
    -[CNContactInlineActionsViewController setDefaultActionPerType:](self, "setDefaultActionPerType:", MEMORY[0x1E0C9AA70]);
  }
}

- (void)loadCachedActions
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  -[CNContactInlineActionsViewController supportedActionTypes](self, "supportedActionTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CNContactInlineActionsViewController_loadCachedActions__block_invoke;
  v6[3] = &unk_1E204F530;
  v6[4] = self;
  objc_msgSend(v5, "_cn_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactInlineActionsViewController processModels:](self, "processModels:", v4);

}

- (void)displayAllSupportedTypesDisabled
{
  void *v3;
  void *v4;
  id v5;

  -[CNContactInlineActionsViewController supportedActionTypes](self, "supportedActionTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_map:", &__block_literal_global_18_59923);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactInlineActionsViewController processModels:](self, "processModels:", v4);

}

- (void)processModels:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CNContactInlineActionsViewController *v10;

  v4 = a3;
  -[CNContactInlineActionsViewController defaultActionPerType](self, "defaultActionPerType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CNContactInlineActionsViewController_processModels___block_invoke;
  v8[3] = &unk_1E204F5D0;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(v4, "_cn_each:", v8);

  -[CNContactInlineActionsViewController setDefaultActionPerType:](self, "setDefaultActionPerType:", v7);
}

- (void)setDefaultActionPerType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (NSDictionary)defaultActionPerType
{
  return self->_defaultActionPerType;
}

- (void)loadView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CNActionsView *v7;

  v7 = objc_alloc_init(CNActionsView);
  -[CNContactInlineActionsViewController supportedActionTypes](self, "supportedActionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNActionsView setSortedActionTypes:](v7, "setSortedActionTypes:", v3);

  -[CNActionsView setActionsDelegate:](v7, "setActionsDelegate:", self);
  -[CNContactInlineActionsViewController actionTypesInterspace](self, "actionTypesInterspace");
  -[CNActionsView setSpacing:](v7, "setSpacing:");
  -[CNActionsView setStyle:](v7, "setStyle:", -[CNContactInlineActionsViewController viewStyle](self, "viewStyle"));
  -[CNContactInlineActionsViewController setView:](self, "setView:", v7);
  -[CNContactInlineActionsViewController setActionsView:](self, "setActionsView:", v7);
  -[CNContactInlineActionsViewController supportedActionTypes](self, "supportedActionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    -[CNContactInlineActionsViewController actionsView](self, "actionsView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

  }
}

- (NSArray)supportedActionTypes
{
  return self->_supportedActionTypes;
}

- (void)setActionsView:(id)a3
{
  objc_storeWeak((id *)&self->_actionsView, a3);
}

- (void)discoverAvailableActionTypes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  id location;
  _QWORD v35[6];

  -[CNContactInlineActionsViewController contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortDebugDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactInlineActionsViewController.m", 386, 7, CFSTR("%@ canceling previous action discovering requests, contact now is %@"), v4, v5, v6, v7, (uint64_t)self);

  -[CNContactInlineActionsViewController tokens](self, "tokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke;
  v35[3] = &unk_1E204F558;
  v35[4] = self;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v35);

  -[CNContactInlineActionsViewController setTokens:](self, "setTokens:", MEMORY[0x1E0C9AA60]);
  -[CNContactInlineActionsViewController contact](self, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v28 = 0;
    v29 = (id *)&v28;
    v30 = 0x3042000000;
    v31 = __Block_byref_object_copy__59901;
    v32 = __Block_byref_object_dispose__59902;
    v33 = 0;
    -[CNContactInlineActionsViewController contact](self, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDebugDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactInlineActionsViewController.m", 406, 7, CFSTR("%@ subscribing action discovering requests for contact %@."), v13, v14, v15, v16, (uint64_t)self);

    -[CNContactInlineActionsViewController allModelsObservable](self, "allModelsObservable");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController schedulerProvider](self, "schedulerProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "backgroundScheduler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "subscribeOn:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0D13AF0];
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke_42;
    v26[3] = &unk_1E204F5A8;
    objc_copyWeak(&v27, &location);
    v26[4] = &v28;
    objc_msgSend(v21, "observerWithResultBlock:", v26);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "subscribe:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObject:", v23);
    objc_storeWeak(v29 + 5, v23);
    -[CNContactInlineActionsViewController setTokens:](self, "setTokens:", v11);

    objc_destroyWeak(&v27);
    _Block_object_dispose(&v28, 8);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
}

- (void)setTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)checkinLaunchTasksForUndiscoverableActionsForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  id v17;

  v4 = a3;
  -[CNContactInlineActionsViewController environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchCheckinRegistrar");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v4, "phoneNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  v10 = 32 * (v7 == 0);
  if (!v9)
    goto LABEL_3;
  -[CNContactInlineActionsViewController environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionDiscoveringEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "capabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "areTelephonyCallsSupported");

  if ((v14 & 1) == 0)
LABEL_3:
    v10 |= 8uLL;
  if (v7 | v9)
    v15 = v10;
  else
    v15 = v10 | 0x10;
  v16 = v17;
  if (v15)
  {
    objc_msgSend(v17, "checkInLaunchTasks:");
    v16 = v17;
  }

}

- (id)allModelsObservable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  -[CNContactInlineActionsViewController supportedActionTypes](self, "supportedActionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__CNContactInlineActionsViewController_allModelsObservable__block_invoke;
  v14[3] = &unk_1E204F4C8;
  v14[4] = self;
  objc_msgSend(v3, "_cn_map:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D13AE8];
  -[CNContactInlineActionsViewController schedulerProvider](self, "schedulerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "merge:schedulerProvider:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "scan:seed:", &__block_literal_global_33_59911, MEMORY[0x1E0C9AA70]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactInlineActionsViewController throttleDelay](self, "throttleDelay");
  v10 = v9;
  -[CNContactInlineActionsViewController schedulerProvider](self, "schedulerProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "throttle:schedulerProvider:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (double)throttleDelay
{
  _BOOL4 v2;
  double result;

  v2 = -[CNContactInlineActionsViewController displaysUnavailableActionTypes](self, "displaysUnavailableActionTypes");
  result = 0.025;
  if (!v2)
    return 0.0;
  return result;
}

- (double)actionTypesInterspace
{
  return self->_actionTypesInterspace;
}

- (CNContactInlineActionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CNContactInlineActionsViewController *v9;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D13D88]);
  objc_msgSend(v5, "actionDiscoveringEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDiscoveringEnvironment:", v7);

  v9 = -[CNContactInlineActionsViewController initWithActionListDataSource:environment:](self, "initWithActionListDataSource:environment:", v8, v5);
  return v9;
}

- (CNContactInlineActionsViewController)initWithContactActionsContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNContactInlineActionsViewController *v7;

  v4 = a3;
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNContactInlineActionsViewController initWithActionListDataSource:environment:](self, "initWithActionListDataSource:environment:", v5, v6);
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CNContactInlineActionsViewController tokens](self, "tokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_59931);

  v4.receiver = self;
  v4.super_class = (Class)CNContactInlineActionsViewController;
  -[CNContactInlineActionsViewController dealloc](&v4, sel_dealloc);
}

- (void)setActionTypesInterspace:(double)a3
{
  id v4;

  self->_actionTypesInterspace = a3;
  -[CNContactInlineActionsViewController actionsView](self, "actionsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpacing:", a3);

}

- (void)removeVisibleActionItems:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__CNContactInlineActionsViewController_removeVisibleActionItems___block_invoke;
  v3[3] = &unk_1E204F478;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v6)
  {
    -[CNContactInlineActionsViewController actionsController](self, "actionsController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v12)
    {
      -[CNContactInlineActionsViewController actionsView](self, "actionsView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "actionTypes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "actionViewForType:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "updateWithMenuItems:", v6);
    }
  }

}

- (void)removeActionForType:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[CNContactInlineActionsViewController existingActionItemForType:](self, "existingActionItemForType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNContactInlineActionsViewController actionItems](self, "actionItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__CNContactInlineActionsViewController_removeActionForType___block_invoke;
    v9[3] = &unk_1E204F5F8;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "_cn_filter:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController setActionItems:](self, "setActionItems:", v7);

    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController removeVisibleActionItems:](self, "removeVisibleActionItems:", v8);

  }
}

- (void)didSelectAction:(id)a3 withSourceView:(id)a4 longPress:(BOOL)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;

  v18 = a3;
  if (!-[CNContactInlineActionsViewController isGroupActionsView](self, "isGroupActionsView"))
  {
    if (a5)
    {
      objc_msgSend(v18, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactInlineActionsViewController generateActionsControllerForActionType:](self, "generateActionsControllerForActionType:", v8);

      -[CNContactInlineActionsViewController actionsController](self, "actionsController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "retrieveModels");

      objc_msgSend(v18, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactInlineActionsViewController notifyDelegateOfDisambiguationForActionType:](self, "notifyDelegateOfDisambiguationForActionType:", v7);
      goto LABEL_12;
    }
    -[CNContactInlineActionsViewController defaultActionPerType](self, "defaultActionPerType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[CNContactInlineActionsViewController defaultActionPerType](self, "defaultActionPerType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactInlineActionsViewController performAction:](self, "performAction:", v15);

    }
    else
    {
      -[CNContactInlineActionsViewController delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) == 0)
      {
LABEL_11:
        objc_msgSend(v18, "type");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactInlineActionsViewController notifyDelegateOfPerformedActionType:fromDisambiguation:](self, "notifyDelegateOfPerformedActionType:fromDisambiguation:", v7, 0);
        goto LABEL_12;
      }
      -[CNContactInlineActionsViewController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contactInlineActionsViewController:didSelectActionOfType:", self, v14);
    }

    goto LABEL_11;
  }
  if (!a5)
  {
    objc_msgSend(v18, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController performGroupActionForType:](self, "performGroupActionForType:", v7);
LABEL_12:

  }
}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v5 = a4;
  -[CNContactInlineActionsViewController actionsControllerPresentation](self, "actionsControllerPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__CNContactInlineActionsViewController_contactActionsController_didSelectAction___block_invoke;
  v13[3] = &unk_1E204F648;
  v13[4] = self;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v13);

  -[CNContactInlineActionsViewController performAction:](self, "performAction:", v5);
  -[CNContactInlineActionsViewController actionsController](self, "actionsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactInlineActionsViewController actionListDataSource](self, "actionListDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactInlineActionsViewController contact](self, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "consumer:didSelectItem:forContact:actionType:", self, v5, v12, v10);

  -[CNContactInlineActionsViewController notifyDelegateOfPerformedActionType:fromDisambiguation:](self, "notifyDelegateOfPerformedActionType:fromDisambiguation:", v10, 1);
  -[CNContactInlineActionsViewController setActionsController:](self, "setActionsController:", 0);

}

- (void)performAction:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  id v25;

  v25 = a3;
  -[CNContactInlineActionsViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    goto LABEL_3;
  -[CNContactInlineActionsViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "contactProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "contactInlineActionsViewController:shouldPerformActionOfType:withContactProperty:", self, v7, v8);

  if (v9)
  {
LABEL_3:
    -[CNContactInlineActionsViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[CNContactInlineActionsViewController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contactInlineActionsViewController:willPerformActionOfType:", self, v13);

    }
    v14 = objc_alloc_init(MEMORY[0x1E0D13D70]);
    -[CNContactInlineActionsViewController geminiChannelIdentifier](self, "geminiChannelIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15
      && (v16 = (void *)v15,
          -[CNContactInlineActionsViewController geminiChannelIdentifier](self, "geminiChannelIdentifier"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "length"),
          v17,
          v16,
          v18))
    {
      -[CNContactInlineActionsViewController geminiChannelIdentifier](self, "geminiChannelIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setChannelIdentifier:", v19);
    }
    else
    {
      -[CNContactInlineActionsViewController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) == 0)
      {
LABEL_11:
        v24 = (id)objc_msgSend(v25, "performActionWithContext:", v14);

        goto LABEL_12;
      }
      -[CNContactInlineActionsViewController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "geminiDataSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "channelIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setChannelIdentifier:", v23);

    }
    goto LABEL_11;
  }
LABEL_12:

}

- (void)generateActionsControllerForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  CNContactActionsController *v10;
  void *v11;
  void *v12;
  void *v13;
  CNContactActionsController *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNContactInlineActionsViewController actionsController](self, "actionsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelModels");

  -[CNContactInlineActionsViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0
    || (-[CNContactInlineActionsViewController delegate](self, "delegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "contactInlineActionsViewController:shouldPresentDisambiguationUIForActionOfType:", self, v4), v8, v9))
  {
    v10 = [CNContactActionsController alloc];
    -[CNContactInlineActionsViewController contact](self, "contact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactInlineActionsViewController actionListDataSource](self, "actionListDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CNContactActionsController initWithContact:dataSource:actionTypes:](v10, "initWithContact:dataSource:actionTypes:", v11, v12, v13);
    -[CNContactInlineActionsViewController setActionsController:](self, "setActionsController:", v14);

    -[CNContactInlineActionsViewController actionsController](self, "actionsController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShouldUseOutlinedActionGlyphStyle:", 1);

    -[CNContactInlineActionsViewController actionsController](self, "actionsController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", self);

  }
}

- (void)setupGroupActions
{
  void *v3;
  _QWORD v4[5];

  -[CNContactInlineActionsViewController supportedActionTypes](self, "supportedActionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__CNContactInlineActionsViewController_setupGroupActions__block_invoke;
  v4[3] = &unk_1E204F620;
  v4[4] = self;
  objc_msgSend(v3, "_cn_each:", v4);

}

- (void)performGroupActionForType:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[CNContactInlineActionsViewController isGroupActionsView](self, "isGroupActionsView"))
  {
    -[CNContactInlineActionsViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CNContactInlineActionsViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contactInlineActionsViewController:didSelectActionOfType:", self, v7);

      -[CNContactInlineActionsViewController notifyDelegateOfPerformedActionType:fromDisambiguation:](self, "notifyDelegateOfPerformedActionType:fromDisambiguation:", v7, 0);
    }
  }

}

- (void)notifyDelegateOfPerformedActionType:(id)a3 fromDisambiguation:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[CNContactInlineActionsViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNContactInlineActionsViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactInlineActionsViewController:didPerformActionOfType:fromDisambiguation:", self, v9, v4);

  }
}

- (void)notifyDelegateOfDisambiguationForActionType:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CNContactInlineActionsViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactInlineActionsViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactInlineActionsViewController:willPresentDisambiguationUIForActionType:", self, v7);

  }
}

- (CNUIObjectViewControllerDelegate)objectViewControllerDelegate
{
  return (CNUIObjectViewControllerDelegate *)objc_loadWeakRetained((id *)&self->objectViewControllerDelegate);
}

- (NSString)geminiChannelIdentifier
{
  return self->_geminiChannelIdentifier;
}

- (void)setGeminiChannelIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_geminiChannelIdentifier, a3);
}

- (CNCustomPresentation)actionsControllerPresentation
{
  return self->_actionsControllerPresentation;
}

- (void)setActionsControllerPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_actionsControllerPresentation, a3);
}

- (void)setSchedulerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_schedulerProvider, a3);
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setActionsController:(id)a3
{
  objc_storeStrong((id *)&self->_actionsController, a3);
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (void)setActionListDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_actionListDataSource, a3);
}

- (UIColor)posterTintColor
{
  return self->_posterTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterTintColor, 0);
  objc_destroyWeak((id *)&self->_actionsView);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_actionListDataSource, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_actionsControllerPresentation, 0);
  objc_storeStrong((id *)&self->_defaultActionPerType, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_actionItems, 0);
  objc_storeStrong((id *)&self->_geminiChannelIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_supportedActionTypes, 0);
  objc_destroyWeak((id *)&self->objectViewControllerDelegate);
}

void __57__CNContactInlineActionsViewController_setupGroupActions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "contactInlineActionsViewController:canPerformGroupActionOfType:", *(_QWORD *)(a1 + 32), v7);

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "displayActionForType:withDefaultAction:enabled:", v7, 0, v6);

}

uint64_t __81__CNContactInlineActionsViewController_contactActionsController_didSelectAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActionsControllerPresentation:", 0);
}

BOOL __60__CNContactInlineActionsViewController_removeActionForType___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

void __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke_2;
  v7[3] = &unk_1E204F648;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "performBlock:", v7);

}

void __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke_2_43;
  aBlock[3] = &unk_1E204F580;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v9 = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v8 = v4;
  v5 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performBlock:", v5);

  objc_destroyWeak(&v10);
}

void __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke_2_43(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (v2)
  {
    objc_msgSend(WeakRetained, "tokens");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", v2);

    if (v4)
      objc_msgSend(WeakRetained, "processModels:", *(_QWORD *)(a1 + 32));
  }

}

uint64_t __68__CNContactInlineActionsViewController_discoverAvailableActionTypes__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __65__CNContactInlineActionsViewController_removeVisibleActionItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "actionsView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeActionItem:", v3);

}

uint64_t __47__CNContactInlineActionsViewController_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

+ (id)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0D13D88], "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactInlineActionsViewController descriptorForRequiredKeys]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
