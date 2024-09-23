@implementation AVTAvatarActionsMenuController

- (AVTAvatarActionsMenuController)initWithDataSource:(id)a3 avtViewProvider:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTAvatarActionsMenuController *v12;
  AVTAvatarActionsMenuController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarActionsMenuController;
  v12 = -[AVTAvatarActionsMenuController init](&v15, sel_init);
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
  UIMenu *actionsMenu;

  -[AVTAvatarActionsMenuController setActionsModel:](self, "setActionsModel:", a3);
  -[AVTAvatarActionsMenuController actionsModel](self, "actionsModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  actionsMenu = self->_actionsMenu;
  self->_actionsMenu = 0;

}

- (UIMenu)actionsMenu
{
  UIMenu *actionsMenu;
  void *v5;
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
  UIMenu *v27;
  UIMenu *v28;
  UIMenu *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  actionsMenu = self->_actionsMenu;
  if (actionsMenu)
    return actionsMenu;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsMenuController actionsModel](self, "actionsModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AVTAvatarActionsMenuController actionsModel](self, "actionsModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "editAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  -[AVTAvatarActionsMenuController actionsModel](self, "actionsModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "duplicateAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AVTAvatarActionsMenuController actionsModel](self, "actionsModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "duplicateAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

  }
  -[AVTAvatarActionsMenuController actionsModel](self, "actionsModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deleteAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[AVTAvatarActionsMenuController actionsModel](self, "actionsModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deleteAction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v17);

  }
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1EA5207B8, 0, 0, 1, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsMenuController actionsModel](self, "actionsModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "createAction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0CEA740];
    -[AVTAvatarActionsMenuController actionsModel](self, "actionsModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "createAction");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "menuWithTitle:image:identifier:options:children:", &stru_1EA5207B8, 0, 0, 1, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addObject:", v26);
  }
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1EA5207B8, v19);
  v27 = (UIMenu *)objc_claimAutoreleasedReturnValue();
  v28 = self->_actionsMenu;
  self->_actionsMenu = v27;

  v29 = self->_actionsMenu;
  return v29;
}

- (void)performCreateForActionsModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AVTAvatarActionsMenuController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalRecordStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarActionsMenuController avtViewSessionProvider](self, "avtViewSessionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarEditorViewController viewControllerForCreatingAvatarInStore:avtViewSessionProvider:](AVTAvatarEditorViewController, "viewControllerForCreatingAvatarInStore:avtViewSessionProvider:", v7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarActionsMenuController presentEditor:forCreating:](self, "presentEditor:forCreating:", v6, 1);
}

- (void)performEditForActionsModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AVTAvatarActionsMenuController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalRecordStore");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarActionsMenuController actionsModel](self, "actionsModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avatarRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsMenuController avtViewSessionProvider](self, "avtViewSessionProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarEditorViewController viewControllerForEditingAvatar:avtViewSessionProvider:store:](AVTAvatarEditorViewController, "viewControllerForEditingAvatar:avtViewSessionProvider:store:", v6, v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAvatarActionsMenuController presentEditor:forCreating:](self, "presentEditor:forCreating:", v8, 0);
}

- (void)presentEditor:(id)a3 forCreating:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[AVTAvatarActionsMenuController setIsCreatingAvatar:](self, "setIsCreatingAvatar:", v4);
  -[AVTAvatarActionsMenuController setEditorViewController:](self, "setEditorViewController:", v6);
  objc_msgSend(v6, "setDelegate:", self);
  -[AVTAvatarActionsMenuController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentEditorViewController:forActionsController:isCreate:", v6, self, v4);

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

  -[AVTAvatarActionsMenuController environment](self, "environment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usageTrackingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsMenuController actionsModel](self, "actionsModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatarRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didDuplicateAvatar:", v7);

  -[AVTAvatarActionsMenuController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalRecordStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarActionsMenuController actionsModel](self, "actionsModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "avatarRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__AVTAvatarActionsMenuController_performDuplicateForActionsModel___block_invoke;
  v12[3] = &unk_1EA51D598;
  v12[4] = self;
  objc_msgSend(v9, "duplicateAvatar:completionBlock:", v11, v12);

}

void __66__AVTAvatarActionsMenuController_performDuplicateForActionsModel___block_invoke(uint64_t a1, int a2, void *a3)
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
    v7[2] = __66__AVTAvatarActionsMenuController_performDuplicateForActionsModel___block_invoke_2;
    v7[3] = &unk_1EA51D570;
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __66__AVTAvatarActionsMenuController_performDuplicateForActionsModel___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionsController:didDuplicateToRecord:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

- (void)performDeleteForActionsModel:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[AVTAvatarActionsMenuController actionsModel](self, "actionsModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avatarRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AVTAvatarActionsMenuController_performDeleteForActionsModel___block_invoke;
  v7[3] = &unk_1EA51D228;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[AVTAvatarActionsMenuController confirmShouldDeleteRecord:resultBlock:](self, "confirmShouldDeleteRecord:resultBlock:", v6, v7);

}

void __63__AVTAvatarActionsMenuController_performDeleteForActionsModel___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
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
    objc_msgSend(*(id *)(a1 + 32), "environment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "usageTrackingSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didDeleteAvatar:", *(_QWORD *)(a1 + 40));

    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTAvatarActionsRecordUpdate recordUpdateForDeletingRecord:withDataSource:](AVTAvatarActionsRecordUpdate, "recordUpdateForDeletingRecord:withDataSource:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "internalRecordStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__AVTAvatarActionsMenuController_performDeleteForActionsModel___block_invoke_2;
    v12[3] = &unk_1EA51D5E8;
    v10 = *(void **)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v10;
    v14 = v7;
    v11 = v7;
    objc_msgSend(v9, "deleteAvatar:completionHandler:", v13, v12);

  }
}

void __63__AVTAvatarActionsMenuController_performDeleteForActionsModel___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__AVTAvatarActionsMenuController_performDeleteForActionsModel___block_invoke_3;
    block[3] = &unk_1EA51D5C0;
    v3 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    v6 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __63__AVTAvatarActionsMenuController_performDeleteForActionsModel___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionsController:didDeleteRecord:withRecordUpdate:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v6 = a4;
  v7 = a3;
  v8 = -[AVTAvatarActionsMenuController isCreatingAvatar](self, "isCreatingAvatar");
  if (-[AVTAvatarActionsMenuController isCreatingAvatar](self, "isCreatingAvatar"))
  {
    -[AVTAvatarActionsMenuController setIsCreatingAvatar:](self, "setIsCreatingAvatar:", 0);
    -[AVTAvatarActionsMenuController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionsController:didAddRecord:", self, v6);
  }
  else
  {
    -[AVTAvatarActionsMenuController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionsController:didEditRecord:", self, v6);
  }

  -[AVTAvatarActionsMenuController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__AVTAvatarActionsMenuController_avatarEditorViewController_didFinishWithAvatarRecord___block_invoke;
  v11[3] = &unk_1EA51D188;
  v11[4] = self;
  objc_msgSend(v10, "dismissEditorViewController:forActionsController:wasCreate:didEdit:animated:completion:", v7, self, v8, 1, 1, v11);

}

uint64_t __87__AVTAvatarActionsMenuController_avatarEditorViewController_didFinishWithAvatarRecord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEditorViewController:", 0);
}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = -[AVTAvatarActionsMenuController isCreatingAvatar](self, "isCreatingAvatar");
  -[AVTAvatarActionsMenuController setIsCreatingAvatar:](self, "setIsCreatingAvatar:", 0);
  objc_msgSend(v4, "setDisableAvatarSnapshotting:", 1);
  -[AVTAvatarActionsMenuController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__AVTAvatarActionsMenuController_avatarEditorViewControllerDidCancel___block_invoke;
  v7[3] = &unk_1EA51D188;
  v7[4] = self;
  objc_msgSend(v6, "dismissEditorViewController:forActionsController:wasCreate:didEdit:animated:completion:", v4, self, v5, 0, 1, v7);

}

uint64_t __70__AVTAvatarActionsMenuController_avatarEditorViewControllerDidCancel___block_invoke(uint64_t a1)
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

- (void)confirmShouldDeleteRecord:(id)a3 resultBlock:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void (**v13)(id, uint64_t);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  void (**v24)(id, uint64_t);
  _QWORD v25[4];
  void (**v26)(id, uint64_t);

  v5 = (void (**)(id, uint64_t))a4;
  if (AVTUIDisableDeleteConfirmation_once())
  {
    v5[2](v5, 1);
  }
  else
  {
    AVTAvatarUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE_MEMOJI_ALERT_MESSAGE"), &stru_1EA5207B8, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTAlertController alertControllerWithTitle:message:preferredStyle:](AVTAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CEA2E0];
    AVTAvatarUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DELETE_MEMOJI_ALERT_CANCEL"), &stru_1EA5207B8, CFSTR("Localized"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__AVTAvatarActionsMenuController_confirmShouldDeleteRecord_resultBlock___block_invoke;
    v25[3] = &unk_1EA51D610;
    v13 = v5;
    v26 = v13;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v14);

    v15 = (void *)MEMORY[0x1E0CEA2E0];
    AVTAvatarUIBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DELETE_MEMOJI_ALERT_CONFIRM"), &stru_1EA5207B8, CFSTR("Localized"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v12;
    v21 = 3221225472;
    v22 = __72__AVTAvatarActionsMenuController_confirmShouldDeleteRecord_resultBlock___block_invoke_2;
    v23 = &unk_1EA51D610;
    v24 = v13;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 2, &v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v18, v20, v21, v22, v23);

    -[AVTAvatarActionsMenuController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "actionsController:presentAlertController:", self, v8);

  }
}

uint64_t __72__AVTAvatarActionsMenuController_confirmShouldDeleteRecord_resultBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__AVTAvatarActionsMenuController_confirmShouldDeleteRecord_resultBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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

- (void)setActionsMenu:(id)a3
{
  objc_storeStrong((id *)&self->_actionsMenu, a3);
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
  objc_storeStrong((id *)&self->_actionsMenu, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_actionsModel, 0);
}

@end
