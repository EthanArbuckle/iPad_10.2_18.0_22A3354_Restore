@implementation EKEventURLInlineEditItem

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsURLField");

  return v5;
}

- (void)reset
{
  UITableViewCell *cell;

  cell = self->_cell;
  self->_cell = 0;

}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  UITableViewCell *cell;
  EKUITableViewCell *v5;
  UITableViewCell *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  cell = self->_cell;
  if (!cell)
  {
    v5 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1000, 0);
    v6 = self->_cell;
    self->_cell = &v5->super;

    -[UITableViewCell setSelectionStyle:](self->_cell, "setSelectionStyle:", 0);
    -[UITableViewCell setTextFieldOffset:](self->_cell, "setTextFieldOffset:", 0.0);
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("URL"), &stru_1E601DFA8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPlaceholder:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClearButtonMode:", 1);

    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setKeyboardType:", 3);

    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAutocorrectionType:", 1);

    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAutocapitalizationType:", 0);

    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setReturnKeyType:", 9);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v18);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextColor:", v20);

    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CalDisableFocusRingForView();

    -[EKEventURLInlineEditItem refreshFromCalendarItemAndStore](self, "refreshFromCalendarItemAndStore");
    cell = self->_cell;
  }
  return cell;
}

- (BOOL)isInline
{
  return 1;
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  UITableViewCell *cell;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  cell = self->_cell;
  if (cell && !self->_tokenized)
  {
    -[UITableViewCell editableTextField](cell, "editableTextField", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "_lp_URLWithUserTypedString:relativeToURL:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = v6;
        _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_ERROR, "Failed to create NSURL from user-entered URL %@. This data will not be saved.", (uint8_t *)&v11, 0xCu);
      }
    }
    -[EKEventEditItem event](self, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setURL:", v7);

  }
  self->_hasChanges = 0;
  -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
  return 1;
}

- (void)refreshFromCalendarItemAndStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)EKEventURLInlineEditItem;
  -[EKCalendarItemEditItem refreshFromCalendarItemAndStore](&v17, sel_refreshFromCalendarItemAndStore);
  -[EKEventEditItem event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("message"));
  v8 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("sms"));
  v9 = objc_msgSend(v6, "cal_isWalletURL");
  if (!v7)
  {
    EventKitUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("Show in Mail");
LABEL_10:
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E601DFA8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 1;
    goto LABEL_11;
  }
  if (!v8)
  {
    EventKitUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("Show in Messages");
    goto LABEL_10;
  }
  if (!v9)
  {
LABEL_6:
    objc_msgSend(v4, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  EventKitUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Show in Wallet"), &stru_1E601DFA8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v12 = 0;
LABEL_11:
  -[UITableViewCell editableTextField](self->_cell, "editableTextField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v11);

  -[EKEventURLInlineEditItem _setTokenized:](self, "_setTokenized:", v12);
}

- (void)_setTokenized:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_tokenized != a3)
  {
    v3 = a3;
    self->_tokenized = a3;
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "setClearButtonMode:", 3);

      -[UITableViewCell tintColor](self->_cell, "tintColor");
    }
    else
    {
      objc_msgSend(v5, "setClearButtonMode:", 1);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    }
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell editableTextField](self->_cell, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextColor:", v8);

  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return !self->_tokenized;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  self->_hasChanges = 1;
  -[EKEventURLInlineEditItem _setTokenized:](self, "_setTokenized:", 0);
  -[EKCalendarItemEditItem notifyTextChanged](self, "notifyTextChanged");
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  -[EKCalendarItemEditItem setSelectedResponder:](self, "setSelectedResponder:", a3);
  -[EKCalendarItemEditItem notifyDidStartEditing](self, "notifyDidStartEditing");
}

- (void)textFieldDidEndEditing:(id)a3
{
  -[EKCalendarItemEditItem notifyDidEndEditing](self, "notifyDidEndEditing", a3);
  -[EKCalendarItemEditItem setSelectedResponder:](self, "setSelectedResponder:", 0);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  self->_hasChanges = 1;
  -[EKCalendarItemEditItem notifyTextChanged](self, "notifyTextChanged", a3, a4.location, a4.length, a5);
  return 1;
}

- (BOOL)isSaveable
{
  return self->_hasChanges;
}

- (id)searchStringForEventAutocomplete
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
