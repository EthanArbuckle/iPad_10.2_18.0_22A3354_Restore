@implementation CNMeCardSharingSettingsPreferenceMenuCell

- (CNMeCardSharingSettingsPreferenceMenuCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNMeCardSharingSettingsPreferenceMenuCell *v4;
  CNMeCardSharingSettingsPreferenceMenuCell *v5;
  CNMeCardSharingSettingsPreferenceMenuCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNMeCardSharingSettingsPreferenceMenuCell;
  v4 = -[CNMeCardSharingSettingsPreferenceMenuCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNMeCardSharingSettingsPreferenceMenuCell configureAccessoryView](v4, "configureAccessoryView");
    v6 = v5;
  }

  return v5;
}

- (void)setSharingAudience:(unint64_t)a3
{
  void *v5;

  -[CNMeCardSharingSettingsPreferenceMenuCell titleForSharingAudience:](self, "titleForSharingAudience:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingSettingsPreferenceMenuCell updateContentConfigurationWithSecondaryText:](self, "updateContentConfigurationWithSecondaryText:", v5);

  -[CNMeCardSharingSettingsPreferenceMenuCell updateMenuButtonStatesWithSharingAudience:](self, "updateMenuButtonStatesWithSharingAudience:", a3);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CNMeCardSharingSettingsPreferenceMenuCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  -[CNMeCardSharingSettingsPreferenceMenuCell menuButton](self, "menuButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNMeCardSharingSettingsPreferenceMenuCell;
  -[CNMeCardSharingSettingsPreferenceMenuCell layoutSubviews](&v4, sel_layoutSubviews);
  -[CNMeCardSharingSettingsPreferenceMenuCell menuButton](self, "menuButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[CNMeCardSharingSettingsPreferenceMenuCell layoutMenuButton](self, "layoutMenuButton");
}

- (void)configureAccessoryView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0DC3518]);
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(v3, "setIndicator:", 2);
  objc_msgSend(v3, "setIndicatorColorTransformer:", &__block_literal_global_39504);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseForegroundColor:", v4);

  objc_msgSend(v7, "setConfiguration:", v3);
  objc_msgSend(v7, "sizeToFit");
  objc_msgSend(v7, "setEnabled:", 0);
  -[CNMeCardSharingSettingsPreferenceMenuCell setPopupMenuButton:](self, "setPopupMenuButton:", v7);
  -[CNMeCardSharingSettingsPreferenceMenuCell setAccessoryView:](self, "setAccessoryView:", v7);
  v5 = objc_alloc_init(MEMORY[0x1E0DC3518]);
  objc_msgSend(v5, "setShowsMenuAsPrimaryAction:", 1);
  -[CNMeCardSharingSettingsPreferenceMenuCell menu](self, "menu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMenu:", v6);

  -[CNMeCardSharingSettingsPreferenceMenuCell addSubview:](self, "addSubview:", v5);
  -[CNMeCardSharingSettingsPreferenceMenuCell setMenuButton:](self, "setMenuButton:", v5);
  -[CNMeCardSharingSettingsPreferenceMenuCell layoutMenuButton](self, "layoutMenuButton");

}

- (void)layoutMenuButton
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  -[CNMeCardSharingSettingsPreferenceMenuCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  -[CNMeCardSharingSettingsPreferenceMenuCell bounds](self, "bounds");
  v9 = v8;
  v10 = 0.0;
  if (!-[CNMeCardSharingSettingsPreferenceMenuCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
  {
    -[CNMeCardSharingSettingsPreferenceMenuCell bounds](self, "bounds");
    v10 = v11 * 0.5;
  }
  -[CNMeCardSharingSettingsPreferenceMenuCell menuButton](self, "menuButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v10, v5, v9 * 0.5, v7);

  -[CNMeCardSharingSettingsPreferenceMenuCell popupMenuButton](self, "popupMenuButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;

  -[CNMeCardSharingSettingsPreferenceMenuCell menuButton](self, "menuButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAnchorPoint:", v15, v17);

  -[CNMeCardSharingSettingsPreferenceMenuCell menuButton](self, "menuButton");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingSettingsPreferenceMenuCell bringSubviewToFront:](self, "bringSubviewToFront:", v19);

}

- (id)titleForSharingAudience:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  if (a3 == 2)
  {
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SHARING_AUDIENCE_ALWAYS_ASK");
  }
  else
  {
    if (a3 != 1)
    {
      v6 = &stru_1E20507A8;
      return v6;
    }
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SHARING_AUDIENCE_CONTACTS_ONLY");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E20507A8, CFSTR("Localized"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateContentConfigurationWithSecondaryText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0DC39A8];
  v5 = a3;
  objc_msgSend(v4, "valueCellConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SHARING_AUDIENCE_SECTION_HEADER_SMALL_CAPS"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(v8, "setSecondaryText:", v5);
  -[CNMeCardSharingSettingsPreferenceMenuCell setContentConfiguration:](self, "setContentConfiguration:", v8);

}

- (void)updateMenuButtonStatesWithSharingAudience:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  if (a3 == 2)
  {
    -[CNMeCardSharingSettingsPreferenceMenuCell alwaysAskMenuTitle](self, "alwaysAskMenuTitle");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 1)
    {
      v5 = 0;
      goto LABEL_7;
    }
    -[CNMeCardSharingSettingsPreferenceMenuCell contactsOnlyMenuTitle](self, "contactsOnlyMenuTitle");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:
  -[CNMeCardSharingSettingsPreferenceMenuCell menuButton](self, "menuButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menu");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__CNMeCardSharingSettingsPreferenceMenuCell_updateMenuButtonStatesWithSharingAudience___block_invoke;
  v10[3] = &unk_1E204CD18;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "_cn_each:", v10);

}

- (id)menu
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
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0DC3428];
  -[CNMeCardSharingSettingsPreferenceMenuCell contactsOnlyMenuTitle](self, "contactsOnlyMenuTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __49__CNMeCardSharingSettingsPreferenceMenuCell_menu__block_invoke;
  v19[3] = &unk_1E204CD40;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, 0, 0, v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3428];
  -[CNMeCardSharingSettingsPreferenceMenuCell alwaysAskMenuTitle](self, "alwaysAskMenuTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  v15 = 3221225472;
  v16 = __49__CNMeCardSharingSettingsPreferenceMenuCell_menu__block_invoke_2;
  v17 = &unk_1E204CD40;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, 0, 0, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC39D0];
  v22[0] = v6;
  v22[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "menuWithChildren:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  return v12;
}

- (id)contactsOnlyMenuTitle
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHARING_AUDIENCE_CONTACTS_ONLY"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)alwaysAskMenuTitle
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHARING_AUDIENCE_ALWAYS_ASK"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CNMeCardSharingSettingsPreferenceMenuCellDelegate)delegate
{
  return (CNMeCardSharingSettingsPreferenceMenuCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)menuButton
{
  return self->_menuButton;
}

- (void)setMenuButton:(id)a3
{
  objc_storeStrong((id *)&self->_menuButton, a3);
}

- (UIButton)popupMenuButton
{
  return self->_popupMenuButton;
}

- (void)setPopupMenuButton:(id)a3
{
  objc_storeStrong((id *)&self->_popupMenuButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popupMenuButton, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __49__CNMeCardSharingSettingsPreferenceMenuCell_menu__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CNContactsUIBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("SHARING_AUDIENCE_CONTACTS_ONLY"), &stru_1E20507A8, CFSTR("Localized"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "updateContentConfigurationWithSecondaryText:", v2);

  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharingSettingsPreferenceMenuCell:didSelectSharingAudience:", WeakRetained, 1);

}

void __49__CNMeCardSharingSettingsPreferenceMenuCell_menu__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CNContactsUIBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("SHARING_AUDIENCE_ALWAYS_ASK"), &stru_1E20507A8, CFSTR("Localized"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "updateContentConfigurationWithSecondaryText:", v2);

  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharingSettingsPreferenceMenuCell:didSelectSharingAudience:", WeakRetained, 2);

}

void __87__CNMeCardSharingSettingsPreferenceMenuCell_updateMenuButtonStatesWithSharingAudience___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_opt_class();
  v7 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v7;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setState:", objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)));

  }
}

id __67__CNMeCardSharingSettingsPreferenceMenuCell_configureAccessoryView__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.35);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)cellIdentifier
{
  return CFSTR("CNMeCardSharingSettingsPreferenceMenuTableViewCell");
}

@end
