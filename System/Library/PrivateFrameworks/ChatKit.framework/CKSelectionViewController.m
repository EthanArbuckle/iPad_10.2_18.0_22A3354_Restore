@implementation CKSelectionViewController

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKSelectionViewController;
  -[CKSelectionViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[CKSelectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transcriptBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  id v24;

  -[CKSelectionViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedCountForSelectionViewController:", self);

  -[CKSelectionViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldUseRecentlyDeletedConfigurationForSelectionViewController:", self);

  -[CKSelectionViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "secondaryTextForSelectionViewController:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKSelectionViewController _recentlyDeletedConfigurationWithSelectionCount:secondaryText:](self, "_recentlyDeletedConfigurationWithSelectionCount:secondaryText:", v5, v10);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v24 = (id)v11;

    goto LABEL_7;
  }
  v12 = objc_msgSend(v8, "shouldUseJunkFilteringConfigurationForSelectionViewController:", self);

  if (v12)
  {
    -[CKSelectionViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "secondaryTextForSelectionViewController:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKSelectionViewController _junkFilteringConfigurationWithSelectionCount:secondaryText:](self, "_junkFilteringConfigurationWithSelectionCount:secondaryText:", v5, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[CKSelectionViewController _defaultConfigurationWithSelectionCount:](self, "_defaultConfigurationWithSelectionCount:", v5);
  v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  -[CKSelectionViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "areSelectedConversationsBlocked");

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("BLOCKED_CONVERSATIONS_SELECTED"), &stru_1E276D870, CFSTR("ChatKit"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v18, v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

    if (v21 == 1)
      v22 = CFSTR("\u200F");
    else
      v22 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setText:", v23);
  }
  -[CKSelectionViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v24);

}

- (id)_defaultConfigurationWithSelectionCount:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CEA4A8], "emptyExtraProminentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CONVERSATIONS_SELECTED"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

  if (v10 == 1)
    v11 = CFSTR("\u200F");
  else
    v11 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setText:", v12);
  return v4;
}

- (id)_recentlyDeletedConfigurationWithSelectionCount:(int64_t)a3 secondaryText:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;

  v6 = a4;
  -[CKSelectionViewController _defaultConfigurationWithSelectionCount:](self, "_defaultConfigurationWithSelectionCount:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSecondaryText:", v6);

  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(v7, "buttonProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSelectionViewController _updatePropertiesAsRecoverButton:](self, "_updatePropertiesAsRecoverButton:", v8);

    objc_msgSend(v7, "secondaryButtonProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSelectionViewController _updatePropertiesAsDeleteButton:](self, "_updatePropertiesAsDeleteButton:", v9);

    v10 = a3 > 0;
    objc_msgSend(v7, "buttonProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", v10);

    objc_msgSend(v7, "secondaryButtonProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnabled:", v10);

  }
  return v7;
}

- (id)_junkFilteringConfigurationWithSelectionCount:(int64_t)a3 secondaryText:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[CKSelectionViewController _defaultConfigurationWithSelectionCount:](self, "_defaultConfigurationWithSelectionCount:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSecondaryText:", v6);

  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(v7, "buttonProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 < 1)
      -[CKSelectionViewController _updatePropertiesAsDeleteAllButton:](self, "_updatePropertiesAsDeleteAllButton:", v8);
    else
      -[CKSelectionViewController _updatePropertiesAsDeleteButton:](self, "_updatePropertiesAsDeleteButton:", v8);

    objc_msgSend(v7, "buttonProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 1);

  }
  return v7;
}

- (void)_updatePropertiesAsDeleteButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSelectionViewController _updatePropertiesAsDestructiveButton:buttonText:](self, "_updatePropertiesAsDestructiveButton:buttonText:", v4, v6);

  -[CKSelectionViewController _deleteAction](self, "_deleteAction");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrimaryAction:", v7);

}

- (void)_updatePropertiesAsDeleteAllButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DELETE_ALL"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSelectionViewController _updatePropertiesAsDestructiveButton:buttonText:](self, "_updatePropertiesAsDestructiveButton:buttonText:", v4, v6);

  -[CKSelectionViewController _deleteAllAction](self, "_deleteAllAction");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrimaryAction:", v7);

}

- (void)_updatePropertiesAsDestructiveButton:(id)a3 buttonText:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x1E0CB3778];
  v6 = a4;
  v7 = a3;
  v11 = (id)objc_msgSend([v5 alloc], "initWithString:", v6);

  v8 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAttribute:value:range:", v8, v9, 0, objc_msgSend(v11, "length"));

  objc_msgSend(v7, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAttributedTitle:", v11);
}

- (id)_deleteAction
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA2A8];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CKSelectionViewController__deleteAction__block_invoke;
  v5[3] = &unk_1E274A4C0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "actionWithHandler:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __42__CKSelectionViewController__deleteAction__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "deleteButtonPressedOnSelectionViewController:", v3);

}

- (id)_deleteAllAction
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA2A8];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CKSelectionViewController__deleteAllAction__block_invoke;
  v5[3] = &unk_1E274A4C0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "actionWithHandler:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __45__CKSelectionViewController__deleteAllAction__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "deleteAllButtonPressedOnSelectionViewController:", v3);

}

- (void)_updatePropertiesAsRecoverButton:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = [v4 alloc];
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RECOVER"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v6, "initWithString:", v8);

  objc_msgSend(v5, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedTitle:", v11);

  -[CKSelectionViewController _recoverAction](self, "_recoverAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrimaryAction:", v10);

}

- (id)_recoverAction
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0CEA2A8];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__CKSelectionViewController__recoverAction__block_invoke;
  v5[3] = &unk_1E274A4C0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "actionWithHandler:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __43__CKSelectionViewController__recoverAction__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "recoverButtonPressedOnSelectionViewController:", v3);

}

- (void)handleNewComposeSelection
{
  id v2;

  -[CKSelectionViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionViewControllerSelectedCompose");

}

- (CKSelectionViewControllerDelegate)delegate
{
  return (CKSelectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
