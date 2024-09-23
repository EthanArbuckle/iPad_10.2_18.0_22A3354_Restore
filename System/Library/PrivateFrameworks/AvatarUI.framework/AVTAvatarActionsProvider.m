@implementation AVTAvatarActionsProvider

+ (id)localizedTitleForActionType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 0:
      AVTAvatarUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("EDIT");
      goto LABEL_7;
    case 1:
      AVTAvatarUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("DUPLICATE");
      goto LABEL_7;
    case 2:
      AVTAvatarUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("DELETE");
      goto LABEL_7;
    case 3:
      AVTAvatarUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("CREATE");
LABEL_7:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1EA5207B8, CFSTR("Localized"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (unint64_t)maximumNumberOfActions
{
  return 4;
}

- (AVTAvatarActionsProvider)initWithAvatarRecord:(id)a3 dataSource:(id)a4 allowCreate:(BOOL)a5
{
  id v9;
  id v10;
  AVTAvatarActionsProvider *v11;
  AVTAvatarActionsProvider *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarActionsProvider;
  v11 = -[AVTAvatarActionsProvider init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_avatarRecord, a3);
    objc_storeStrong((id *)&v12->_dataSource, a4);
    v12->_allowCreate = a5;
    -[AVTAvatarActionsProvider generateActions](v12, "generateActions");
  }

  return v12;
}

- (BOOL)canPerformActionType:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;

  -[AVTAvatarActionsProvider avatarRecord](self, "avatarRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditable");

  if (v6)
  {
    -[AVTAvatarActionsProvider dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "internalRecordStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canCreateAvatarWithError:", 0);

    if (a3 != 1)
    {
      if (a3 == 3)
        return -[AVTAvatarActionsProvider allowCreate](self, "allowCreate") & v9;
      else
        LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (void)generateActions
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
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  objc_initWeak(&location, self);
  if (-[AVTAvatarActionsProvider canPerformActionType:](self, "canPerformActionType:", 3))
  {
    v3 = (void *)MEMORY[0x1E0CEA2A8];
    objc_msgSend((id)objc_opt_class(), "localizedTitleForActionType:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __43__AVTAvatarActionsProvider_generateActions__block_invoke;
    v22[3] = &unk_1EA51EAC0;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", v4, 0, CFSTR("create"), v22);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarActionsProvider setCreateAction:](self, "setCreateAction:", v5);

    objc_destroyWeak(&v23);
  }
  if (-[AVTAvatarActionsProvider canPerformActionType:](self, "canPerformActionType:", 0))
  {
    v6 = (void *)MEMORY[0x1E0CEA2A8];
    objc_msgSend((id)objc_opt_class(), "localizedTitleForActionType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __43__AVTAvatarActionsProvider_generateActions__block_invoke_2;
    v20[3] = &unk_1EA51EAC0;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v7, 0, CFSTR("edit"), v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarActionsProvider setEditAction:](self, "setEditAction:", v8);

    objc_destroyWeak(&v21);
  }
  if (-[AVTAvatarActionsProvider canPerformActionType:](self, "canPerformActionType:", 1))
  {
    v9 = (void *)MEMORY[0x1E0CEA2A8];
    objc_msgSend((id)objc_opt_class(), "localizedTitleForActionType:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__AVTAvatarActionsProvider_generateActions__block_invoke_3;
    v18[3] = &unk_1EA51EAC0;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, 0, CFSTR("duplicate"), v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarActionsProvider setDuplicateAction:](self, "setDuplicateAction:", v11);

    objc_destroyWeak(&v19);
  }
  if (-[AVTAvatarActionsProvider canPerformActionType:](self, "canPerformActionType:", 2))
  {
    v12 = (void *)MEMORY[0x1E0CEA2A8];
    objc_msgSend((id)objc_opt_class(), "localizedTitleForActionType:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __43__AVTAvatarActionsProvider_generateActions__block_invoke_4;
    v16[3] = &unk_1EA51EAC0;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v13, 0, CFSTR("delete"), v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarActionsProvider setDeleteAction:](self, "setDeleteAction:", v14);

    -[AVTAvatarActionsProvider deleteAction](self, "deleteAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAttributes:", 2);

    objc_destroyWeak(&v17);
  }
  objc_destroyWeak(&location);
}

void __43__AVTAvatarActionsProvider_generateActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didTapCreateNew");

}

void __43__AVTAvatarActionsProvider_generateActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didTapEdit");

}

void __43__AVTAvatarActionsProvider_generateActions__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didTapDuplicate");

}

void __43__AVTAvatarActionsProvider_generateActions__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didTapDelete:", 0);

}

- (void)didTapCreateNew
{
  id v3;

  -[AVTAvatarActionsProvider delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performCreateForActionsModel:", self);

}

- (void)didTapEdit
{
  id v3;

  -[AVTAvatarActionsProvider delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performEditForActionsModel:", self);

}

- (void)didTapDuplicate
{
  id v3;

  -[AVTAvatarActionsProvider delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performDuplicateForActionsModel:", self);

}

- (void)didTapDelete:(id)a3
{
  id v4;

  -[AVTAvatarActionsProvider delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performDeleteForActionsModel:", self);

}

- (AVTAvatarActionsModelDelegate)delegate
{
  return (AVTAvatarActionsModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (UIAction)createAction
{
  return self->_createAction;
}

- (void)setCreateAction:(id)a3
{
  objc_storeStrong((id *)&self->_createAction, a3);
}

- (UIAction)editAction
{
  return self->_editAction;
}

- (void)setEditAction:(id)a3
{
  objc_storeStrong((id *)&self->_editAction, a3);
}

- (UIAction)duplicateAction
{
  return self->_duplicateAction;
}

- (void)setDuplicateAction:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateAction, a3);
}

- (UIAction)deleteAction
{
  return self->_deleteAction;
}

- (void)setDeleteAction:(id)a3
{
  objc_storeStrong((id *)&self->_deleteAction, a3);
}

- (BOOL)allowCreate
{
  return self->_allowCreate;
}

- (AVTAvatarRecordDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_deleteAction, 0);
  objc_storeStrong((id *)&self->_duplicateAction, 0);
  objc_storeStrong((id *)&self->_editAction, 0);
  objc_storeStrong((id *)&self->_createAction, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
