@implementation HUScheduleRecurrenceEditorViewController

- (HUScheduleRecurrenceEditorViewController)initWithRecurrences:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  HUScheduleRecurrenceEditorViewController *v11;
  HUScheduleRecurrenceEditorViewController *v12;
  void *v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleRecurrenceEditorViewController.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recurrences"));

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:", self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__HUScheduleRecurrenceEditorViewController_initWithRecurrences_delegate___block_invoke;
  v16[3] = &unk_1E6F4FDA0;
  v10 = v7;
  v17 = v10;
  objc_msgSend(v9, "setItemModuleCreator:", v16);
  v15.receiver = self;
  v15.super_class = (Class)HUScheduleRecurrenceEditorViewController;
  v11 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v15, sel_initWithItemManager_tableViewStyle_, v9, 1);
  v12 = v11;
  if (v11)
    objc_storeWeak((id *)&v11->_delegate, v8);

  return v12;
}

id __73__HUScheduleRecurrenceEditorViewController_initWithRecurrences_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HUScheduleRecurrenceEditorItemModule *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HUScheduleRecurrenceEditorItemModule initWithItemUpdater:recurrences:]([HUScheduleRecurrenceEditorItemModule alloc], "initWithItemUpdater:recurrences:", v4, *(_QWORD *)(a1 + 32));

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUScheduleRecurrenceEditorViewController;
  -[HUItemTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  _HULocalizedStringWithDefaultValue(CFSTR("HUScheduleRuleEditor_Repeat"), CFSTR("HUScheduleRuleEditor_Repeat"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleRecurrenceEditorViewController setTitle:](self, "setTitle:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonPressed_);
  -[HUScheduleRecurrenceEditorViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v3;
  HUScheduleRecurrenceEditorItemModuleController *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Unexpected module %@"), v3);
  v4 = -[HUItemModuleController initWithModule:]([HUScheduleRecurrenceEditorItemModuleController alloc], "initWithModule:", v3);

  return v4;
}

- (void)doneButtonPressed:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  HUScheduleRecurrenceEditorViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Done button pressed", (uint8_t *)&v9, 0x16u);

  }
  -[HUScheduleRecurrenceEditorViewController _saveChanges](self, "_saveChanges");
  -[HUScheduleRecurrenceEditorViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

}

- (void)_saveChanges
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  HUScheduleRecurrenceEditorViewController *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HUScheduleRecurrenceEditorViewController _editorItemModule](self, "_editorItemModule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editedRecurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUScheduleRecurrenceEditorViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Notifying delegate [%@] of updated recurrences [%@]", (uint8_t *)&v10, 0x2Au);

  }
  -[HUScheduleRecurrenceEditorViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didUpdateRecurrences:recurrences:", self, v5);

}

- (id)_editorItemModule
{
  void *v2;
  void *v3;
  void *v4;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemModules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_266);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __61__HUScheduleRecurrenceEditorViewController__editorItemModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HUScheduleRecurrenceEditorViewControllerDelegate)delegate
{
  return (HUScheduleRecurrenceEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIBarButtonItem)savedButtonBarItem
{
  return self->_savedButtonBarItem;
}

- (void)setSavedButtonBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_savedButtonBarItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedButtonBarItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
