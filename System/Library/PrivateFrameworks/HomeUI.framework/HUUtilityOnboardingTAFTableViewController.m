@implementation HUUtilityOnboardingTAFTableViewController

- (HUUtilityOnboardingTAFTableViewController)initWithContext:(id)a3 itemManager:(id)a4 tableViewStyle:(int64_t)a5
{
  id v9;
  HUUtilityOnboardingTAFTableViewController *v10;
  HUUtilityOnboardingTAFTableViewController *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUUtilityOnboardingTAFTableViewController;
  v10 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v13, sel_initWithItemManager_tableViewStyle_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_context, a3);

  return v11;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  HUUtilityOnboardingTAFTableViewController *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = self;
    v14 = 2080;
    v15 = "-[HUUtilityOnboardingTAFTableViewController cellClassForItem:indexPath:]";
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s cell class for item %@ with index %@ ", (uint8_t *)&v12, 0x2Au);

  }
  objc_opt_class();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
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
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  HUUtilityOnboardingTAFTableViewController *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v37 = self;
    v38 = 2080;
    v39 = "-[HUUtilityOnboardingTAFTableViewController setupCell:forItem:indexPath:]";
    v40 = 2112;
    v41 = v10;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%s Set up cell %@ ", buf, 0x20u);

  }
  v11 = v7;
  objc_msgSend(v8, "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPlaceholder:", v13);

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "latestResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0D30C08];
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C08]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Home.OnboardingView.Utility.TAF.TextField.%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textField");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityIdentifier:", v19);

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v21);

  objc_msgSend(v8, "latestResults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[TAFFieldName phone](_TtC6HomeUI12TAFFieldName, "phone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v23, "isEqualToString:", v24);

  if ((_DWORD)v16)
    goto LABEL_7;
  +[TAFFieldName email](_TtC6HomeUI12TAFFieldName, "email");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v23, "isEqualToString:", v25);

  if (v26)
  {
    objc_msgSend(v11, "textField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = 7;
LABEL_8:
    objc_msgSend(v27, "setKeyboardType:", v29);

    goto LABEL_9;
  }
  +[TAFFieldName postalCode](_TtC6HomeUI12TAFFieldName, "postalCode");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v23, "isEqualToString:", v30);

  if (v31)
  {
LABEL_7:
    objc_msgSend(v11, "textField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = 2;
    goto LABEL_8;
  }
LABEL_9:
  -[HUUtilityOnboardingTAFTableViewController context](self, "context");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "tafResponses");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", v23);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textField");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setText:", v34);

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  HUUtilityOnboardingTAFTableViewController *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v6 = a6;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HUUtilityOnboardingTAFTableViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v25, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "latestResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v27 = self;
    v28 = 2080;
    v29 = "-[HUUtilityOnboardingTAFTableViewController updateCell:forItem:indexPath:animated:]";
    v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%s item with results%@ ", buf, 0x20u);

  }
  v14 = v10;
  objc_msgSend(v11, "latestResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPlaceholder:", v16);

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v18);

  objc_msgSend(v11, "latestResults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C08]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUUtilityOnboardingTAFTableViewController context](self, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "tafResponses");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setText:", v23);
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  NSObject *v13;
  void *v14;
  int v15;
  HUUtilityOnboardingTAFTableViewController *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a5, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C08]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityOnboardingTAFTableViewController tafFieldForItem:](self, "tafFieldForItem:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HUUtilityOnboardingTAFTableViewController context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setResponseFor:value:", v10, v7);

    v12 = -[UtilityOnboardingContext allRequiredFieldsComplete](self->_context, "allRequiredFieldsComplete");
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138412802;
      v16 = self;
      v17 = 2080;
      v18 = "-[HUUtilityOnboardingTAFTableViewController textDidChange:forTextField:item:]";
      v19 = 1024;
      v20 = v12;
      _os_log_debug_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEBUG, "%@:%s ENABLING BUTTON --> %{BOOL}d", (uint8_t *)&v15, 0x1Cu);
    }

    -[HUUtilityOnboardingTAFTableViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "didCompleteAllFields:", v12);

  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUUtilityOnboardingTAFTableViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedTextField:", v4);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUUtilityOnboardingTAFTableViewController;
  v5 = a4;
  v6 = a3;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v7, sel_tableView_didSelectRowAtIndexPath_, v6, v5);
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1, v7.receiver, v7.super_class);

}

- (id)tafFieldForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[UtilityOnboardingContext config](self->_context, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__HUUtilityOnboardingTAFTableViewController_tafFieldForItem___block_invoke;
  v10[3] = &unk_1E6F57F00;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __61__HUUtilityOnboardingTAFTableViewController_tafFieldForItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "formKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (TAFTableDelegate)delegate
{
  return (TAFTableDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_TtC6HomeUI24UtilityOnboardingContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContact:(id)a3
{
  objc_storeStrong((id *)&self->_meContact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
