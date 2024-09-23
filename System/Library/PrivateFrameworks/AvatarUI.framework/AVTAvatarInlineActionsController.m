@implementation AVTAvatarInlineActionsController

+ (id)buttonForAction:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "attributes") & 2) != 0)
    +[AVTAvatarActionButton destructiveButtonWithAction:](AVTAvatarActionButton, "destructiveButtonWithAction:", v3);
  else
    +[AVTAvatarActionButton defaultButtonWithAction:](AVTAvatarActionButton, "defaultButtonWithAction:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (AVTAvatarInlineActionsController)initWithDataSource:(id)a3 avtViewProvider:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTAvatarInlineActionsController *v12;
  AVTAvatarInlineActionsController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarInlineActionsController;
  v12 = -[AVTAvatarInlineActionsController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeStrong((id *)&v13->_environment, a5);
    objc_storeStrong((id *)&v13->_avtViewSessionProvider, a4);
  }

  return v13;
}

- (void)updateWithActionsModel:(id)a3
{
  void *v4;
  NSArray *inlineActionButtons;

  -[AVTAvatarInlineActionsController setActionsModel:](self, "setActionsModel:", a3);
  -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  inlineActionButtons = self->_inlineActionButtons;
  self->_inlineActionButtons = 0;

}

- (NSArray)inlineActionButtons
{
  NSArray *inlineActionButtons;
  NSArray *v3;
  NSArray *v5;
  void *v6;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSArray *v30;
  NSArray *v31;

  inlineActionButtons = self->_inlineActionButtons;
  if (inlineActionButtons)
  {
    v3 = inlineActionButtons;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)objc_opt_class();
      -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createAction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "buttonForAction:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v5, "addObject:", v11);

    }
    -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "editAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)objc_opt_class();
      -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "editAction");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "buttonForAction:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v5, "addObject:", v17);

    }
    -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "duplicateAction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)objc_opt_class();
      -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "duplicateAction");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "buttonForAction:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v5, "addObject:", v23);

    }
    -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "deleteAction");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = (void *)objc_opt_class();
      -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "deleteAction");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "buttonForAction:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v5, "addObject:", v29);

    }
    v30 = self->_inlineActionButtons;
    self->_inlineActionButtons = v5;
    v31 = v5;

    v3 = self->_inlineActionButtons;
  }
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
    -[AVTAvatarInlineActionsController inlineActionButtons](self, "inlineActionButtons", 0);
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

- (void)updateForChangedContentCategorySize
{
  NSArray *inlineActionButtons;

  inlineActionButtons = self->_inlineActionButtons;
  self->_inlineActionButtons = 0;

}

- (void)performCreateForActionsModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AVTAvatarInlineActionsController setButtonsDisabled:](self, "setButtonsDisabled:", 1);
  -[AVTAvatarInlineActionsController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalRecordStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarInlineActionsController avtViewSessionProvider](self, "avtViewSessionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarEditorViewController viewControllerForCreatingAvatarInStore:avtViewSessionProvider:](AVTAvatarEditorViewController, "viewControllerForCreatingAvatarInStore:avtViewSessionProvider:", v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setShouldHideUserInfoView:", -[AVTAvatarInlineActionsController shouldHideUserInfoView](self, "shouldHideUserInfoView"));
  -[AVTAvatarInlineActionsController presentEditor:forCreating:](self, "presentEditor:forCreating:", v6, 1);

}

- (void)performEdit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AVTAvatarInlineActionsController setButtonsDisabled:](self, "setButtonsDisabled:", 1);
  -[AVTAvatarInlineActionsController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalRecordStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarInlineActionsController avtViewSessionProvider](self, "avtViewSessionProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarEditorViewController viewControllerForEditingAvatar:avtViewSessionProvider:store:](AVTAvatarEditorViewController, "viewControllerForEditingAvatar:avtViewSessionProvider:store:", v5, v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setShouldHideUserInfoView:", -[AVTAvatarInlineActionsController shouldHideUserInfoView](self, "shouldHideUserInfoView"));
  -[AVTAvatarInlineActionsController presentEditor:forCreating:](self, "presentEditor:forCreating:", v7, 0);

}

- (void)performDuplicateForActionsModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  -[AVTAvatarInlineActionsController setButtonsDisabled:](self, "setButtonsDisabled:", 1);
  -[AVTAvatarInlineActionsController environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usageTrackingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatarRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didDuplicateAvatar:", v7);

  -[AVTAvatarInlineActionsController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalRecordStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "avatarRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__AVTAvatarInlineActionsController_performDuplicateForActionsModel___block_invoke;
  v12[3] = &unk_1EA51D598;
  v12[4] = self;
  objc_msgSend(v9, "duplicateAvatar:completionBlock:", v11, v12);

}

void __68__AVTAvatarInlineActionsController_performDuplicateForActionsModel___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__AVTAvatarInlineActionsController_performDuplicateForActionsModel___block_invoke_2;
    v7[3] = &unk_1EA51D570;
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __68__AVTAvatarInlineActionsController_performDuplicateForActionsModel___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__AVTAvatarInlineActionsController_performDuplicateForActionsModel___block_invoke_3;
  v7[3] = &unk_1EA51D570;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v2, "actionsController:didDuplicateToRecord:completionBlock:", v4, v5, v7);

}

void __68__AVTAvatarInlineActionsController_performDuplicateForActionsModel___block_invoke_3(uint64_t a1)
{
  AVTAvatarActionsProvider *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  AVTAvatarActionsProvider *v7;

  v2 = [AVTAvatarActionsProvider alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "actionsModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AVTAvatarActionsProvider initWithAvatarRecord:dataSource:allowCreate:](v2, "initWithAvatarRecord:dataSource:allowCreate:", v3, v4, objc_msgSend(v5, "allowCreate"));

  objc_msgSend(*(id *)(a1 + 40), "updateWithActionsModel:", v7);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionsControllerDidUpdateActions:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 40), "setButtonsDisabled:", 0);
  if ((AVTUIDisableEditAfterDuplicate_once() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "performEdit");

}

- (void)performDeleteForActionsModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarInlineActionsController inlineActionButtons](self, "inlineActionButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke;
  v9[3] = &unk_1EA51D228;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[AVTAvatarInlineActionsController confirmShouldDeleteRecord:sender:resultBlock:](self, "confirmShouldDeleteRecord:sender:resultBlock:", v8, v7, v9);

}

void __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setButtonsDisabled:", 1);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTAvatarActionsRecordUpdate recordUpdateForDeletingRecord:withDataSource:](AVTAvatarActionsRecordUpdate, "recordUpdateForDeletingRecord:withDataSource:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "usageTrackingSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didDeleteAvatar:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "internalRecordStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke_2;
    v12[3] = &unk_1EA51D5E8;
    v10 = *(void **)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v10;
    v14 = v5;
    v11 = v5;
    objc_msgSend(v9, "deleteAvatar:completionHandler:", v13, v12);

  }
}

void __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke_3;
    block[3] = &unk_1EA51D5C0;
    v3 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    v6 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke_4;
  v8[3] = &unk_1EA51D570;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v2, "actionsController:didDeleteRecord:withRecordUpdate:completionBlock:", v3, v4, v6, v8);

}

void __65__AVTAvatarInlineActionsController_performDeleteForActionsModel___block_invoke_4(uint64_t a1)
{
  AVTAvatarActionsProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  AVTAvatarActionsProvider *v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = [AVTAvatarActionsProvider alloc];
    objc_msgSend(*(id *)(a1 + 32), "avatarRecord");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "actionsModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AVTAvatarActionsProvider initWithAvatarRecord:dataSource:allowCreate:](v2, "initWithAvatarRecord:dataSource:allowCreate:", v3, v4, objc_msgSend(v5, "allowCreate"));

    objc_msgSend(*(id *)(a1 + 40), "updateWithActionsModel:", v7);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionsControllerDidUpdateActions:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 40), "setButtonsDisabled:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (AVTAvatarActionsProvider *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarActionsProvider actionsControllerDidFinish:](v7, "actionsControllerDidFinish:", *(_QWORD *)(a1 + 40));
  }

}

- (void)confirmShouldDeleteRecord:(id)a3 sender:(id)a4 resultBlock:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(id, uint64_t);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  void (**v27)(id, uint64_t);
  _QWORD v28[4];
  void (**v29)(id, uint64_t);

  v7 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  if (AVTUIDisableDeleteConfirmation_once())
  {
    v8[2](v8, 1);
  }
  else
  {
    AVTAvatarUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_MEMOJI_ALERT_MESSAGE"), &stru_1EA5207B8, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTAlertController alertControllerWithTitle:message:preferredStyle:](AVTAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CEA2E0];
    AVTAvatarUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DELETE_MEMOJI_ALERT_CONFIRM"), &stru_1EA5207B8, CFSTR("Localized"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __81__AVTAvatarInlineActionsController_confirmShouldDeleteRecord_sender_resultBlock___block_invoke;
    v28[3] = &unk_1EA51D610;
    v15 = v8;
    v29 = v15;
    objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 2, v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v16);

    v17 = (void *)MEMORY[0x1E0CEA2E0];
    AVTAvatarUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DELETE_MEMOJI_ALERT_CANCEL"), &stru_1EA5207B8, CFSTR("Localized"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __81__AVTAvatarInlineActionsController_confirmShouldDeleteRecord_sender_resultBlock___block_invoke_2;
    v26 = &unk_1EA51D610;
    v27 = v15;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, &v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v20, v23, v24, v25, v26);

    objc_msgSend(v11, "popoverPresentationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSourceView:", v7);

    -[AVTAvatarInlineActionsController delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "actionsController:presentAlertController:", self, v11);

  }
}

uint64_t __81__AVTAvatarInlineActionsController_confirmShouldDeleteRecord_sender_resultBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__AVTAvatarInlineActionsController_confirmShouldDeleteRecord_sender_resultBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentEditor:(id)a3 forCreating:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[AVTAvatarInlineActionsController setIsCreatingAvatar:](self, "setIsCreatingAvatar:", v4);
  objc_msgSend(v6, "setDelegate:", self);
  -[AVTAvatarInlineActionsController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentEditorViewController:forActionsController:isCreate:", v6, self, v4);

}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  id v5;
  AVTAvatarActionsProvider *v6;
  AVTAvatarActionsProvider *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  if (-[AVTAvatarInlineActionsController isCreatingAvatar](self, "isCreatingAvatar"))
  {
    -[AVTAvatarInlineActionsController setIsCreatingAvatar:](self, "setIsCreatingAvatar:", 0);
    -[AVTAvatarInlineActionsController delegate](self, "delegate");
    v6 = (AVTAvatarActionsProvider *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarActionsProvider actionsController:didAddRecord:](v6, "actionsController:didAddRecord:", self, v5);
  }
  else
  {
    v7 = [AVTAvatarActionsProvider alloc];
    -[AVTAvatarInlineActionsController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarInlineActionsController actionsModel](self, "actionsModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AVTAvatarActionsProvider initWithAvatarRecord:dataSource:allowCreate:](v7, "initWithAvatarRecord:dataSource:allowCreate:", v5, v8, objc_msgSend(v9, "allowCreate"));

    -[AVTAvatarInlineActionsController updateWithActionsModel:](self, "updateWithActionsModel:", v6);
    -[AVTAvatarInlineActionsController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarActionsProvider avatarRecord](v6, "avatarRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionsController:didEditRecord:", self, v10);

  }
  -[AVTAvatarInlineActionsController setButtonsDisabled:](self, "setButtonsDisabled:", 0);
  -[AVTAvatarInlineActionsController delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionsControllerDidFinish:", self);

}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = -[AVTAvatarInlineActionsController isCreatingAvatar](self, "isCreatingAvatar");
  -[AVTAvatarInlineActionsController setIsCreatingAvatar:](self, "setIsCreatingAvatar:", 0);
  -[AVTAvatarInlineActionsController setButtonsDisabled:](self, "setButtonsDisabled:", 0);
  objc_msgSend(v4, "setDisableAvatarSnapshotting:", 1);
  -[AVTAvatarInlineActionsController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__AVTAvatarInlineActionsController_avatarEditorViewControllerDidCancel___block_invoke;
  v7[3] = &unk_1EA51D188;
  v7[4] = self;
  objc_msgSend(v6, "dismissEditorViewController:forActionsController:wasCreate:didEdit:animated:completion:", v4, self, v5, 0, 1, v7);

}

uint64_t __72__AVTAvatarInlineActionsController_avatarEditorViewControllerDidCancel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "actionsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionsController:didCancelEditingRecord:", v3, v5);

  return objc_msgSend(*(id *)(a1 + 32), "setEditorViewController:", 0);
}

- (AVTAvatarActionsProvider)actionsModel
{
  return self->_actionsModel;
}

- (void)setActionsModel:(id)a3
{
  objc_storeStrong((id *)&self->_actionsModel, a3);
}

- (AVTAvatarRecordDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (AVTAvatarActionsControllerDelegate)delegate
{
  return (AVTAvatarActionsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setInlineActionButtons:(id)a3
{
  objc_storeStrong((id *)&self->_inlineActionButtons, a3);
}

- (BOOL)shouldHideUserInfoView
{
  return self->_shouldHideUserInfoView;
}

- (void)setShouldHideUserInfoView:(BOOL)a3
{
  self->_shouldHideUserInfoView = a3;
}

- (BOOL)buttonsDisabled
{
  return self->_buttonsDisabled;
}

- (AVTAvatarEditorViewController)editorViewController
{
  return self->_editorViewController;
}

- (void)setEditorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_editorViewController, a3);
}

- (AVTViewSessionProvider)avtViewSessionProvider
{
  return self->_avtViewSessionProvider;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (BOOL)isCreatingAvatar
{
  return self->_isCreatingAvatar;
}

- (void)setIsCreatingAvatar:(BOOL)a3
{
  self->_isCreatingAvatar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avtViewSessionProvider, 0);
  objc_storeStrong((id *)&self->_editorViewController, 0);
  objc_storeStrong((id *)&self->_inlineActionButtons, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_actionsModel, 0);
}

@end
