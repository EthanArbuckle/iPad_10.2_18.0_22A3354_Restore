@implementation CNUIFavoritesEntryPicker

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[CNUIFavoritesEntryPicker actionMenuHelper](self, "actionMenuHelper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNUIFavoritesEntryPicker contextMenuInteraction](self, "contextMenuInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateWithMenuItems:contextMenuInteraction:", v5, v6);

}

- (CNActionMenuHelper)actionMenuHelper
{
  return self->_actionMenuHelper;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)menuProviderForContextMenuInteraction:(id)a3
{
  CNActionMenuHelper *v4;
  void *v5;
  void *v6;
  void *v7;
  CNContactActionsController *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CNContactActionsController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  -[CNUIFavoritesEntryPicker setContextMenuInteraction:](self, "setContextMenuInteraction:", a3);
  v4 = objc_alloc_init(CNActionMenuHelper);
  -[CNUIFavoritesEntryPicker setActionMenuHelper:](self, "setActionMenuHelper:", v4);

  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_ADD_TO_FAVORITES"), &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIFavoritesEntryPicker actionMenuHelper](self, "actionMenuHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMenuTitle:", v6);

  v8 = [CNContactActionsController alloc];
  -[CNUIFavoritesEntryPicker contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C965F8];
  v22[0] = *MEMORY[0x1E0C96620];
  v22[1] = v10;
  v11 = *MEMORY[0x1E0C96618];
  v22[2] = *MEMORY[0x1E0C96658];
  v22[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CNContactActionsController initWithContact:actionTypes:](v8, "initWithContact:actionTypes:", v9, v12);
  -[CNUIFavoritesEntryPicker setActionsController:](self, "setActionsController:", v13);

  -[CNUIFavoritesEntryPicker actionsController](self, "actionsController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShouldUseOutlinedActionGlyphStyle:", 1);

  -[CNUIFavoritesEntryPicker actionsController](self, "actionsController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDisplayMenuIconAtTopLevel:", 1);

  -[CNUIFavoritesEntryPicker actionsController](self, "actionsController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setGenerateFavoritesListItemsOnly:", 1);

  -[CNUIFavoritesEntryPicker actionsController](self, "actionsController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", self);

  -[CNUIFavoritesEntryPicker actionsController](self, "actionsController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "retrieveModels");

  -[CNUIFavoritesEntryPicker actionMenuHelper](self, "actionMenuHelper");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "menuProviderWithActionBlock:", &__block_literal_global_19_38514);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
}

- (void)setActionsController:(id)a3
{
  objc_storeStrong((id *)&self->_actionsController, a3);
}

- (void)setActionMenuHelper:(id)a3
{
  objc_storeStrong((id *)&self->_actionMenuHelper, a3);
}

- (CNUIFavoritesEntryPicker)initWithContact:(id)a3
{
  id v5;
  CNUIFavoritesEntryPicker *v6;
  CNUIFavoritesEntryPicker *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNUIFavoritesEntryPicker;
  v6 = -[CNUIFavoritesEntryPicker init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contact, a3);

  return v7;
}

- (CNContact)contact
{
  return self->_contact;
}

- (id)viewController
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  CNContactActionsController *v12;
  void *v13;
  CNContactActionsController *v14;
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
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id location;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  -[CNUIFavoritesEntryPicker alertController](self, "alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNUIFavoritesEntryPicker alertController](self, "alertController");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = *MEMORY[0x1E0C965F8];
    v30[0] = *MEMORY[0x1E0C96620];
    v30[1] = v5;
    v6 = *MEMORY[0x1E0C96618];
    v30[2] = *MEMORY[0x1E0C96658];
    v30[3] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFavoritesEntryPicker delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[CNUIFavoritesEntryPicker delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "actionTypesForFavoritesEntryPicker:", self);
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v11;
    }
    v12 = [CNContactActionsController alloc];
    -[CNUIFavoritesEntryPicker contact](self, "contact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CNContactActionsController initWithContact:actionTypes:](v12, "initWithContact:actionTypes:", v13, v7);
    -[CNUIFavoritesEntryPicker setActionsController:](self, "setActionsController:", v14);

    -[CNUIFavoritesEntryPicker actionsController](self, "actionsController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", self);

    -[CNUIFavoritesEntryPicker actionsController](self, "actionsController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setGenerateFavoritesListItemsOnly:", 1);

    v17 = (void *)MEMORY[0x1E0DC3450];
    CNContactsUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("PHONE_ACTION_ADD_TO_FAVORITES"), &stru_1E20507A8, CFSTR("Localized"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v19, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUIFavoritesEntryPicker actionsController](self, "actionsController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "viewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setContentViewController:", v22);

    objc_initWeak(&location, self);
    v23 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __42__CNUIFavoritesEntryPicker_viewController__block_invoke;
    v27[3] = &unk_1E204CC50;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 1, v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v26);

    -[CNUIFavoritesEntryPicker setAlertController:](self, "setAlertController:", v20);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

    return v20;
  }
}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CNUIFavoritesEntryPicker alertController](self, "alertController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNUIFavoritesEntryPicker alertController](self, "alertController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

    -[CNUIFavoritesEntryPicker setAlertController:](self, "setAlertController:", 0);
  }
  v8 = v5;
  v9 = v8;
  if (!objc_msgSend(v8, "isSuggested"))
    goto LABEL_6;
  v9 = objc_alloc_init(MEMORY[0x1E0D13D70]);
  v10 = (void *)MEMORY[0x1E0C97300];
  objc_msgSend(v8, "contactProperty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptorsForRequiredKeysForPropertyKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "curateActionWithContext:withKeysToFetch:", v9, v13);
  v14 = objc_claimAutoreleasedReturnValue();

  if (v14)
  {

    v9 = (id)v14;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C97300], "favoritesEntryForUserActionItem:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "contactProperty");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v17;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_18AC56000, v16, OS_LOG_TYPE_INFO, "Did select favorites entry with contact property %@ with action item %@", (uint8_t *)&v20, 0x16u);

    }
    -[CNUIFavoritesEntryPicker delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "favoritesEntryPicker:didPickEntry:", self, v15);

    -[CNUIFavoritesEntryPicker setActionsController:](self, "setActionsController:", 0);
    -[CNUIFavoritesEntryPicker setActionMenuHelper:](self, "setActionMenuHelper:", 0);

    goto LABEL_9;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = 138412290;
    v21 = v8;
    _os_log_error_impl(&dword_18AC56000, v19, OS_LOG_TYPE_ERROR, "Failed to curate suggestion for action item %@", (uint8_t *)&v20, 0xCu);
  }

  -[CNUIFavoritesEntryPicker setActionsController:](self, "setActionsController:", 0);
  -[CNUIFavoritesEntryPicker setActionMenuHelper:](self, "setActionMenuHelper:", 0);
LABEL_9:

}

- (CNUIFavoritesEntryPickerDelegate)delegate
{
  return (CNUIFavoritesEntryPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_actionMenuHelper, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __42__CNUIFavoritesEntryPicker_viewController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAlertController:", 0);

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
  +[CNContactActionsController descriptorForRequiredKeys](CNContactActionsController, "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNUIFavoritesEntryPicker descriptorForRequiredKeys]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)log
{
  if (log_cn_once_token_1_38529 != -1)
    dispatch_once(&log_cn_once_token_1_38529, &__block_literal_global_38530);
  return (id)log_cn_once_object_1_38531;
}

void __31__CNUIFavoritesEntryPicker_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNUIFavoritesEntryPicker");
  v1 = (void *)log_cn_once_object_1_38531;
  log_cn_once_object_1_38531 = (uint64_t)v0;

}

@end
