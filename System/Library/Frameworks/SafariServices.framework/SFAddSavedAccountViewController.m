@implementation SFAddSavedAccountViewController

- (SFAddSavedAccountViewController)initWithGroupID:(id)a3
{
  id v4;
  SFAddSavedAccountViewController *v5;
  uint64_t v6;
  NSString *groupID;
  SFAddSavedAccountViewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAddSavedAccountViewController;
  v5 = -[SFAddSavedAccountViewController initWithStyle:](&v10, sel_initWithStyle_, 2);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (SFAddSavedAccountViewController)initWithSuggestedDomain:(id)a3
{
  return -[SFAddSavedAccountViewController initWithSuggestedDomain:password:](self, "initWithSuggestedDomain:password:", a3, 0);
}

- (SFAddSavedAccountViewController)initWithSuggestedDomain:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  SFAddSavedAccountViewController *v8;
  uint64_t v9;
  NSString *suggestedDomain;
  uint64_t v11;
  NSString *password;
  SFAddSavedAccountViewController *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFAddSavedAccountViewController;
  v8 = -[SFAddSavedAccountViewController initWithStyle:](&v15, sel_initWithStyle_, 2);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    suggestedDomain = v8->_suggestedDomain;
    v8->_suggestedDomain = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    password = v8->_password;
    v8->_password = (NSString *)v11;

    v8->_shouldPopulatePasswordFieldWithNewGeneratedStrongPassword = objc_msgSend(v7, "length") == 0;
    v13 = v8;
  }

  return v8;
}

- (void)viewDidLoad
{
  UIBarButtonItem *v3;
  UIBarButtonItem *cancelBarButtonItem;
  UIBarButtonItem *v5;
  UIBarButtonItem *doneBarButtonItem;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFAddSavedAccountViewController;
  -[SFAddSavedAccountViewController viewDidLoad](&v10, sel_viewDidLoad);
  v3 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelBarButtonItemTapped_);
  cancelBarButtonItem = self->_cancelBarButtonItem;
  self->_cancelBarButtonItem = v3;

  -[UIBarButtonItem setAccessibilityIdentifier:](self->_cancelBarButtonItem, "setAccessibilityIdentifier:", CFSTR("Add Password Navigation Bar Cancel Button"));
  v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneBarButtonItemTapped_);
  doneBarButtonItem = self->_doneBarButtonItem;
  self->_doneBarButtonItem = v5;

  -[UIBarButtonItem setAccessibilityIdentifier:](self->_doneBarButtonItem, "setAccessibilityIdentifier:", CFSTR("Add Password Navigation Bar Done Button"));
  -[UIBarButtonItem setEnabled:](self->_doneBarButtonItem, "setEnabled:", 0);
  -[SFAddSavedAccountViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  objc_msgSend(v7, "setLeftBarButtonItem:", self->_cancelBarButtonItem);
  objc_msgSend(v7, "setRightBarButtonItem:", self->_doneBarButtonItem);
  -[SFAddSavedAccountViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("Add Password View"));

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFAddSavedAccountViewController;
  -[SFAddSavedAccountViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SFAddSavedAccountViewController _updateHeaderViewCell](self, "_updateHeaderViewCell");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFAddSavedAccountViewController;
  -[SFAddSavedAccountViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[SFAddSavedAccountViewController setEditing:](self, "setEditing:", 1);
  if (!self->_didPreFillAndFocusFields)
  {
    -[SFAddSavedAccountViewController _preFillStrongPasswordIfRequested](self, "_preFillStrongPasswordIfRequested");
    -[SFAccountHeaderViewCell titleTextField](self->_titleCell, "titleTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString length](self->_suggestedDomain, "length"))
    {
      -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    objc_msgSend(v4, "becomeFirstResponder");
    self->_didPreFillAndFocusFields = 1;

  }
}

- (BOOL)shouldPopulatePasswordFieldWithNewGeneratedStrongPassword
{
  return self->_shouldPopulatePasswordFieldWithNewGeneratedStrongPassword
      && -[NSString length](self->_password, "length") == 0;
}

- (void)_preFillStrongPasswordIfRequested
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[SFAddSavedAccountViewController shouldPopulatePasswordFieldWithNewGeneratedStrongPassword](self, "shouldPopulatePasswordFieldWithNewGeneratedStrongPassword"))
  {
    -[SFAccountHeaderViewCell titleTextField](self->_titleCell, "titleTextField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_stringByTrimmingWhitespace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D8AC08], "userTypedTitleShouldBeTreatedAsAWebsiteWhenAddingNewAccount:", v5))
    {
      objc_msgSend(v5, "safari_bestURLForUserTypedString");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v10 = (id)v6;
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "autoGeneratedPasswordForURL:respectingPasswordRequirements:maxLength:", v10, 0, -1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

  }
}

- (void)_cancelBarButtonItemTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "addSavedAccountViewControllerDidFinish:withSavedAccount:", self, 0);

}

- (void)_doneBarButtonItemTapped:(id)a3
{
  objc_msgSend(a3, "setEnabled:", 0);
  -[SFAddSavedAccountViewController _attemptToSavePassword](self, "_attemptToSavePassword");
}

- (void)_textFieldChanged:(id)a3
{
  id v4;

  v4 = a3;
  -[SFAddSavedAccountViewController _updateDoneButtonEnabledState](self, "_updateDoneButtonEnabledState");
  -[SFAddSavedAccountViewController _updateTextSuggestionsForTextField:](self, "_updateTextSuggestionsForTextField:", v4);

}

- (void)_updateDoneButtonEnabledState
{
  void *v3;
  id v4;

  -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[UIBarButtonItem setEnabled:](self->_doneBarButtonItem, "setEnabled:", objc_msgSend(v4, "length") != 0);
}

- (void)_updateTextSuggestionsForTextField:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if (v5)
  {
    -[SFAddSavedAccountViewController _updateTextInputSuggestionsForUserNameField](self, "_updateTextInputSuggestionsForUserNameField");
  }
  else
  {
    -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqual:", v6);

    if (v7)
      -[SFAddSavedAccountViewController _updateTextInputSuggestionsForPasswordField](self, "_updateTextInputSuggestionsForPasswordField");
  }

}

- (void)_updateTextInputSuggestionsForUserNameField
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SFAddSavedAccountViewController *v9;

  -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8A070], "sharedProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForUserNameField__block_invoke;
  v7[3] = &unk_1E4AC00B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "suggestedUsersOfType:matchingText:completionHandler:", 0, v6, v7);

}

void __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForUserNameField__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForUserNameField__block_invoke_2;
  v9[3] = &unk_1E4AC6610;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(a2, "safari_mapAndFilterObjectsUsingBlock:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForUserNameField__block_invoke_3;
  block[3] = &unk_1E4ABFB20;
  block[4] = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

id __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForUserNameField__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safari_isCaseInsensitiveEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0DC3E40];
    objc_msgSend(v3, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textSuggestionWithInputText:searchText:", v8, *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForUserNameField__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "editableTextField");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputSuggestionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuggestions:", *(_QWORD *)(a1 + 40));

}

- (void)_updateTextInputSuggestionsForPasswordField
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[SFAccountHeaderViewCell titleTextField](self->_titleCell, "titleTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_stringByTrimmingWhitespace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D8AC08], "userTypedTitleShouldBeTreatedAsAWebsiteWhenAddingNewAccount:", v9))
    {
      objc_msgSend(v9, "safari_bestURLForUserTypedString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "autoGeneratedPasswordForURL:respectingPasswordRequirements:maxLength:", v10, 0, -1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0DC3E40], "textSuggestionWithInputText:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _WBSLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHeaderText:", v14);

      objc_msgSend(v13, "setDisplayText:", v12);
      v18[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForPasswordField__block_invoke;
  v16[3] = &unk_1E4ABFB20;
  v16[4] = self;
  v17 = v6;
  v15 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

void __78__SFAddSavedAccountViewController__updateTextInputSuggestionsForPasswordField__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "editableTextField");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputSuggestionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSuggestions:", *(_QWORD *)(a1 + 40));

}

- (id)_websiteAndCustomTitleFromTextFields
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;

  -[SFAccountHeaderViewCell titleTextField](self->_titleCell, "titleTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_stringByTrimmingWhitespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(MEMORY[0x1E0D8AC08], "userTypedTitleShouldBeTreatedAsAWebsiteWhenAddingNewAccount:", v4);
  if (v5)
    v6 = 0;
  else
    v6 = v4;
  if (v5)
    v7 = v4;
  else
    v7 = 0;
  v8 = (objc_class *)MEMORY[0x1E0D8AA70];
  v9 = v4;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithFirst:second:", v7, v6);

  return v10;
}

- (void)_attemptToSavePassword
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *notesForEditing;
  NSString *groupID;
  int v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  -[SFAddSavedAccountViewController _websiteAndCustomTitleFromTextFields](self, "_websiteAndCustomTitleFromTextFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  notesForEditing = self->_notesForEditing;
  groupID = self->_groupID;
  v26 = 0;
  v13 = objc_msgSend(v10, "canSaveUser:password:forUserTypedSite:notes:customTitle:groupID:error:", v7, v9, v4, notesForEditing, v5, groupID, &v26);
  v14 = v26;

  if (v13)
  {
    -[SFAddSavedAccountViewController _savePasswordAndDismiss](self, "_savePasswordAndDismiss");
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0D8A748], "alertTitleForFailedAccountCreationWithErrorCode:", objc_msgSend(v14, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D8A748];
    v25 = v5;
    v17 = objc_msgSend(v14, "code");
    objc_msgSend(v4, "safari_highLevelDomainFromHost");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alertSubtitleForFailedAccountCreationWithErrorCode:forUserTypedSite:userTypedUsername:highLevelDomain:", v17, v4, v7, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "alertControllerWithTitle:message:preferredStyle:", v15, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0D8A748], "alertDismissActionTitleForFailedAccountCreation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v23);

    v5 = v25;
    -[SFAddSavedAccountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);

  }
}

- (void)_savePasswordAndDismiss
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SFAddSavedAccountViewController _websiteAndCustomTitleFromTextFields](self, "_websiteAndCustomTitleFromTextFields");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "first");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "second");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "saveUser:password:forUserTypedSite:customTitle:notesEntry:groupID:", v8, v10, v4, v5, self->_notesForEditing, self->_groupID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "addSavedAccountViewControllerDidFinish:withSavedAccount:", self, v11);
  }

}

- (void)_updateHeaderViewCell
{
  SFAccountHeaderViewCell *titleCell;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  titleCell = self->_titleCell;
  -[SFAccountHeaderViewCell titleTextField](titleCell, "titleTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_highLevelDomainForPasswordManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_lp_userVisibleHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountHeaderViewCell setHeaderTitleForHighLevelDomain:customTitle:](titleCell, "setHeaderTitleForHighLevelDomain:customTitle:", v7, self->_titleForEditing);

  -[SFAddSavedAccountViewController _updateIcon](self, "_updateIcon");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  int v8;

  v4 = a3;
  -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SFEditableTableViewCell editableTextField](self->_passwordCell, "editableTextField");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == v4)
  {
    objc_msgSend(v6, "becomeFirstResponder");
    goto LABEL_6;
  }
  if (v6 != v4)
  {
LABEL_6:

    goto LABEL_7;
  }
  v8 = -[UIBarButtonItem isEnabled](self->_doneBarButtonItem, "isEnabled");

  if (v8)
    -[SFAddSavedAccountViewController _attemptToSavePassword](self, "_attemptToSavePassword");
LABEL_7:

  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return a4 == 1;
  else
    return 3;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 != 1)
    return 0;
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateIcon
{
  -[SFAddSavedAccountViewController _updateIconForCell:](self, "_updateIconForCell:", self->_titleCell);
}

- (void)_updateIconForCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[SFAccountHeaderViewCell titleTextField](self->_titleCell, "titleTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_stringByTrimmingWhitespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D8AC08], "userTypedTitleShouldBeTreatedAsAWebsiteWhenAddingNewAccount:", v6))
  {
    objc_msgSend(v6, "safari_bestURLForUserTypedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_highLevelDomainForPasswordManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    +[_SFAccountManagerAppearanceValues defaultMonogramBackgroundColor](_SFAccountManagerAppearanceValues, "defaultMonogramBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMonogramBackgroundColor:", v11);
    goto LABEL_20;
  }
  objc_msgSend(WeakRetained, "iconControllerForAddSavedAccountDetailViewController:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconForDomain:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "size");
    if (v15 != 56.0 || v14 != 56.0)
    {
      objc_msgSend(MEMORY[0x1E0D8A9C8], "resizedImage:withSize:", v13);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v18 = (void *)v17;

      v13 = v18;
      goto LABEL_16;
    }
  }
  if (self->_bundleIDForFallbackIcon && objc_msgSend(v6, "isEqualToString:", self->_suggestedDomain))
  {
    objc_msgSend(v11, "appIconForBundleID:", self->_bundleIDForFallbackIcon);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_16:
  if (v13)
  {
    objc_msgSend(v20, "setIcon:", v13);
  }
  else
  {
    objc_msgSend(v11, "backgroundColorForDomain:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMonogramBackgroundColor:", v19);

  }
LABEL_20:

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SFEditableTableViewCell *v10;
  SFEditableTableViewCell *v11;
  SFEditableTableViewCell *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  SFAccountHeaderViewCell *v17;
  SFAccountHeaderViewCell *v18;
  SFAccountHeaderViewCell **p_titleCell;
  NSString *suggestedDomain;
  void *v21;
  void *v22;
  void *v23;
  SFAccountHeaderViewCell *v24;
  SFAccountNoteTableViewCell *v25;
  SFAccountNoteTableViewCell *notesCell;
  NSString *notesForEditing;
  void *v28;
  SFAccountNoteTableViewCell *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  SFEditableTableViewCell **p_passwordCell;
  NSString *password;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  SFEditableTableViewCell **p_userCell;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  void *v46;
  id v47;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("editableTableViewCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = -[SFEditableTableViewCell initWithEnabledState:]([SFEditableTableViewCell alloc], "initWithEnabledState:", 1);
  v11 = v10;

  v12 = v11;
  -[SFEditableTableViewCell editableTextField](v12, "editableTextField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__textFieldChanged_, 0x20000);
  v14 = objc_msgSend(v7, "section");
  if (v14 != 1)
  {
    if (!v14)
    {
      v15 = objc_msgSend(v7, "item");
      switch(v15)
      {
        case 2:
          objc_msgSend(MEMORY[0x1E0C99EA0], "_pm_defaults");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "_sf_passwordManagerIsInDemoMode") ^ 1;

          _WBSLocalizedString();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setPlaceholder:", v32);

          objc_msgSend(v13, "setSecureTextEntry:", v31);
          objc_msgSend(v13, "setDisplaySecureTextUsingPlainText:", v31);
          _WBSLocalizedString();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFEditableTableViewCell textLabel](v12, "textLabel");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setText:", v33);

          p_passwordCell = &self->_passwordCell;
          objc_storeStrong((id *)&self->_passwordCell, v11);
          -[SFEditableTableViewCell setAccessibilityIdentifier:](self->_passwordCell, "setAccessibilityIdentifier:", CFSTR("Add Password Password Cell"));
          if (-[NSString length](self->_password, "length"))
          {
            password = self->_password;
            -[SFEditableTableViewCell editableTextField](*p_passwordCell, "editableTextField");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setText:", password);

          }
          break;
        case 1:
          _WBSLocalizedString();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setPlaceholder:", v38);

          _WBSLocalizedString();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFEditableTableViewCell textLabel](v12, "textLabel");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setText:", v39);

          p_userCell = &self->_userCell;
          objc_storeStrong((id *)p_userCell, v11);
          -[SFEditableTableViewCell setAccessibilityIdentifier:](*p_userCell, "setAccessibilityIdentifier:", CFSTR("Add Password User Name Cell"));
          break;
        case 0:
          -[SFAddSavedAccountViewController tableView](self, "tableView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "dequeueReusableCellWithIdentifier:", CFSTR("AddPasswordTitleCell"));
          v17 = (SFAccountHeaderViewCell *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (!v17)
            v18 = -[SFAccountHeaderViewCell initWithStyle:reuseIdentifier:]([SFAccountHeaderViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("AddPasswordTitleCell"));
          p_titleCell = &self->_titleCell;
          objc_storeStrong((id *)&self->_titleCell, v18);
          if (!v17)

          if (-[NSString length](self->_suggestedDomain, "length"))
          {
            suggestedDomain = self->_suggestedDomain;
            -[SFAccountHeaderViewCell titleTextField](*p_titleCell, "titleTextField");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setText:", suggestedDomain);

            objc_storeStrong((id *)&self->_titleForEditing, self->_suggestedDomain);
          }
          -[SFAccountHeaderViewCell titleTextField](*p_titleCell, "titleTextField");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setKeyboardType:", 3);

          -[SFAccountHeaderViewCell titleTextField](*p_titleCell, "titleTextField");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setAutocapitalizationType:", 0);

          -[SFAddSavedAccountViewController _updateHeaderViewCell](self, "_updateHeaderViewCell");
          -[SFAccountHeaderViewCell setDelegate:](*p_titleCell, "setDelegate:", self);
          -[SFAccountHeaderViewCell setAccessibilityIdentifier:](*p_titleCell, "setAccessibilityIdentifier:", CFSTR("Add Password Website Cell"));
          v24 = *p_titleCell;
          goto LABEL_21;
      }
    }
    v24 = v12;
LABEL_21:
    v29 = (SFAccountNoteTableViewCell *)v24;
    goto LABEL_22;
  }
  v25 = -[SFAccountNoteTableViewCell initWithStyle:reuseIdentifier:]([SFAccountNoteTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("NotesCell"));
  notesCell = self->_notesCell;
  self->_notesCell = v25;

  -[SFAccountNoteTableViewCell setDelegate:](self->_notesCell, "setDelegate:", self);
  notesForEditing = self->_notesForEditing;
  -[SFAccountNoteTableViewCell textView](self->_notesCell, "textView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setText:", notesForEditing);

  objc_initWeak(&location, self);
  v43 = MEMORY[0x1E0C809B0];
  v44 = 3221225472;
  v45 = __67__SFAddSavedAccountViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v46 = &unk_1E4ABFF20;
  objc_copyWeak(&v47, &location);
  -[SFAccountNoteTableViewCell setTextDidChange:](self->_notesCell, "setTextDidChange:", &v43);
  -[SFAccountNoteTableViewCell setAccessibilityIdentifier:](self->_notesCell, "setAccessibilityIdentifier:", CFSTR("Add Password Notes Cell"), v43, v44, v45, v46);
  v29 = self->_notesCell;
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
LABEL_22:

  return v29;
}

void __67__SFAddSavedAccountViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SFAddSavedAccountViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  block[3] = &unk_1E4ABFF20;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __67__SFAddSavedAccountViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "beginUpdates");
    objc_msgSend(v2, "endUpdates");
    objc_msgSend(v6[132], "textView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v6[134];
    v6[134] = (id)v4;

    objc_msgSend(v6, "_updateDoneButtonEnabledState");
    WeakRetained = v6;
  }

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)accountDetailHeaderViewCell:(id)a3 titleTextFieldDidChange:(id)a4
{
  NSString *v5;
  NSString *titleForEditing;

  objc_msgSend(a4, "text", a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  titleForEditing = self->_titleForEditing;
  self->_titleForEditing = v5;

  -[SFAddSavedAccountViewController _updateHeaderViewCell](self, "_updateHeaderViewCell");
}

- (void)returnKeyActivatedInAccountDetailHeaderViewCell:(id)a3
{
  id v3;

  -[SFEditableTableViewCell editableTextField](self->_userCell, "editableTextField", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)setShouldPopulatePasswordFieldWithNewGeneratedStrongPassword:(BOOL)a3
{
  self->_shouldPopulatePasswordFieldWithNewGeneratedStrongPassword = a3;
}

- (NSString)bundleIDForFallbackIcon
{
  return self->_bundleIDForFallbackIcon;
}

- (void)setBundleIDForFallbackIcon:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDForFallbackIcon, a3);
}

- (SFAddSavedAccountViewControllerDelegate)delegate
{
  return (SFAddSavedAccountViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleIDForFallbackIcon, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_suggestedDomain, 0);
  objc_storeStrong((id *)&self->_notesForEditing, 0);
  objc_storeStrong((id *)&self->_titleForEditing, 0);
  objc_storeStrong((id *)&self->_notesCell, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_userCell, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
}

@end
