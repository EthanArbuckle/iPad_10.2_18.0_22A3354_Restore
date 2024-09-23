@implementation CNPhotoPickerActionsModel

- (CNPhotoPickerActionsModel)initWithProviderItem:(id)a3 assignActionTitleOverride:(id)a4 canDelete:(BOOL)a5 atIndexPath:(id)a6
{
  id v11;
  id v12;
  id v13;
  CNPhotoPickerActionsModel *v14;
  CNPhotoPickerActionsModel *v15;
  uint64_t v16;
  NSArray *currentInlineActionButtons;
  CNPhotoPickerActionsModel *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CNPhotoPickerActionsModel;
  v14 = -[CNPhotoPickerActionsModel init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_providerItem, a3);
    objc_storeStrong((id *)&v15->_indexPath, a6);
    v15->_canDelete = a5;
    objc_storeStrong((id *)&v15->_assignActionTitleOverride, a4);
    -[CNPhotoPickerActionsModel generateInlineActionButtons](v15, "generateInlineActionButtons");
    v16 = objc_claimAutoreleasedReturnValue();
    currentInlineActionButtons = v15->_currentInlineActionButtons;
    v15->_currentInlineActionButtons = (NSArray *)v16;

    v18 = v15;
  }

  return v15;
}

- (BOOL)canPerformActionType:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  if (a3 == 3)
    return -[CNPhotoPickerActionsModel canDelete](self, "canDelete");
  if (a3 != 2 && a3 != 1)
    return 1;
  -[CNPhotoPickerActionsModel providerItem](self, "providerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "allowsVariants"))
  {
    -[CNPhotoPickerActionsModel providerItem](self, "providerItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowsEditing");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)generateInlineActionButtons
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
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (-[CNPhotoPickerActionsModel canPerformActionType:](self, "canPerformActionType:", 0))
  {
    v4 = (void *)objc_opt_class();
    -[CNPhotoPickerActionsModel assignActionTitleOverride](self, "assignActionTitleOverride");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke;
    v23[3] = &unk_1E204F880;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v4, "buttonForActionType:titleOverride:withActionBlock:", 0, v5, v23);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setEnabled:", -[CNPhotoPickerActionsModel buttonsDisabled](self, "buttonsDisabled") ^ 1);
    objc_msgSend(v3, "addObject:", v6);

    objc_destroyWeak(&v24);
  }
  if (-[CNPhotoPickerActionsModel canPerformActionType:](self, "canPerformActionType:", 1))
  {
    v7 = (void *)objc_opt_class();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke_2;
    v21[3] = &unk_1E204F880;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v7, "buttonForActionType:withActionBlock:", 1, v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", -[CNPhotoPickerActionsModel buttonsDisabled](self, "buttonsDisabled") ^ 1);
    objc_msgSend(v3, "addObject:", v8);

    objc_destroyWeak(&v22);
  }
  if (-[CNPhotoPickerActionsModel canPerformActionType:](self, "canPerformActionType:", 2))
  {
    v9 = (void *)objc_opt_class();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke_3;
    v19[3] = &unk_1E204F880;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v9, "buttonForActionType:withActionBlock:", 2, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", -[CNPhotoPickerActionsModel buttonsDisabled](self, "buttonsDisabled") ^ 1);
    objc_msgSend(v3, "addObject:", v10);

    objc_destroyWeak(&v20);
  }
  if (-[CNPhotoPickerActionsModel canPerformActionType:](self, "canPerformActionType:", 3))
  {
    v11 = (void *)objc_opt_class();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke_4;
    v17[3] = &unk_1E204F880;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v11, "buttonForActionType:withActionBlock:", 3, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerActionsModel setDeleteButton:](self, "setDeleteButton:", v12);

    v13 = -[CNPhotoPickerActionsModel buttonsDisabled](self, "buttonsDisabled");
    -[CNPhotoPickerActionsModel deleteButton](self, "deleteButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEnabled:", !v13);

    -[CNPhotoPickerActionsModel deleteButton](self, "deleteButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

    objc_destroyWeak(&v18);
  }
  objc_destroyWeak(&location);
  return v3;
}

- (void)setButtonsDisabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_buttonsDisabled != a3)
  {
    v3 = a3;
    self->_buttonsDisabled = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[CNPhotoPickerActionsModel inlineActionButtons](self, "inlineActionButtons", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      v8 = !v3;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setEnabled:", v8);
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)updateProviderItem:(id)a3
{
  id v4;

  -[CNPhotoPickerActionsModel setProviderItem:](self, "setProviderItem:", a3);
  -[CNPhotoPickerActionsModel generateInlineActionButtons](self, "generateInlineActionButtons");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsModel setCurrentInlineActionButtons:](self, "setCurrentInlineActionButtons:", v4);

}

- (void)didTapAssignToContact
{
  void *v3;
  void *v4;
  id v5;

  -[CNPhotoPickerActionsModel delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsModel providerItem](self, "providerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsModel indexPath](self, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionsModel:didAssignToContact:atIndexPath:", self, v3, v4);

}

- (void)didTapEdit
{
  void *v3;
  void *v4;
  id v5;

  -[CNPhotoPickerActionsModel delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsModel providerItem](self, "providerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsModel indexPath](self, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionsModel:didEdit:atIndexPath:", self, v3, v4);

}

- (void)didTapDuplicate
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[CNPhotoPickerActionsModel setButtonsDisabled:](self, "setButtonsDisabled:", 1);
  -[CNPhotoPickerActionsModel delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsModel providerItem](self, "providerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsModel indexPath](self, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__CNPhotoPickerActionsModel_didTapDuplicate__block_invoke;
  v6[3] = &unk_1E204F648;
  v6[4] = self;
  objc_msgSend(v3, "actionsModel:didDuplicate:atIndexPath:completionBlock:", self, v4, v5, v6);

}

- (void)didTapDelete
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNPhotoPickerActionsModel delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsModel providerItem](self, "providerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsModel indexPath](self, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsModel deleteButton](self, "deleteButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionsModel:didDelete:atIndexPath:withSourceView:", self, v3, v4, v5);

}

- (CNPhotoPickerActionsDelegate)delegate
{
  return (CNPhotoPickerActionsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNPhotoPickerProviderItem)providerItem
{
  return self->_providerItem;
}

- (void)setProviderItem:(id)a3
{
  objc_storeStrong((id *)&self->_providerItem, a3);
}

- (NSArray)currentInlineActionButtons
{
  return self->_currentInlineActionButtons;
}

- (void)setCurrentInlineActionButtons:(id)a3
{
  objc_storeStrong((id *)&self->_currentInlineActionButtons, a3);
}

- (CNPhotoPickerActionButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (BOOL)canDelete
{
  return self->_canDelete;
}

- (void)setCanDelete:(BOOL)a3
{
  self->_canDelete = a3;
}

- (NSString)assignActionTitleOverride
{
  return self->_assignActionTitleOverride;
}

- (void)setAssignActionTitleOverride:(id)a3
{
  objc_storeStrong((id *)&self->_assignActionTitleOverride, a3);
}

- (BOOL)buttonsDisabled
{
  return self->_buttonsDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assignActionTitleOverride, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_currentInlineActionButtons, 0);
  objc_storeStrong((id *)&self->_providerItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __44__CNPhotoPickerActionsModel_didTapDuplicate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setButtonsDisabled:", 0);
}

void __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didTapAssignToContact");

}

void __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didTapEdit");

}

void __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didTapDuplicate");

}

void __56__CNPhotoPickerActionsModel_generateInlineActionButtons__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didTapDelete");

}

+ (id)localizedTitleForActionType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  switch(a3)
  {
    case 0:
      CNContactsUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("PHOTO_ACTION_SELECT_CONTACT");
      goto LABEL_6;
    case 1:
      CNContactsUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("PHOTO_EDIT_LABEL");
      goto LABEL_6;
    case 2:
      CNContactsUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("PHOTO_ACTION_DUPLICATE");
      goto LABEL_6;
    case 3:
      CNContactsUIBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("PHOTO_ACTION_DELETE");
LABEL_6:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E20507A8, CFSTR("Localized"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

+ (unint64_t)maximumNumberOfButtons
{
  return 4;
}

+ (id)buttonForActionType:(int64_t)a3 withActionBlock:(id)a4
{
  return (id)objc_msgSend(a1, "buttonForActionType:titleOverride:withActionBlock:", a3, 0, a4);
}

+ (id)buttonForActionType:(int64_t)a3 titleOverride:(id)a4 withActionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(a1, "localizedTitleForActionType:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (objc_msgSend(a1, "actionIsDestructive:", a3))
    +[CNPhotoPickerActionButton destructiveButtonWithTitle:actionBlock:](CNPhotoPickerActionButton, "destructiveButtonWithTitle:actionBlock:", v11, v9);
  else
    +[CNPhotoPickerActionButton defaultButtonWithTitle:actionBlock:](CNPhotoPickerActionButton, "defaultButtonWithTitle:actionBlock:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)actionIsDestructive:(int64_t)a3
{
  return a3 == 3;
}

@end
