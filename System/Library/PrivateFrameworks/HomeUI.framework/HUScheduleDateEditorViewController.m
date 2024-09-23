@implementation HUScheduleDateEditorViewController

- (HUScheduleDateEditorViewController)initWithDate:(id)a3 editorContext:(unint64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  HUScheduleDateEditorViewController *v13;
  HUScheduleDateEditorViewController *v14;
  void *v16;
  objc_super v17;
  _QWORD v18[4];
  id v19;
  unint64_t v20;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleDateEditorViewController.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:", self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__HUScheduleDateEditorViewController_initWithDate_editorContext_delegate___block_invoke;
  v18[3] = &unk_1E6F50540;
  v12 = v9;
  v19 = v12;
  v20 = a4;
  objc_msgSend(v11, "setItemModuleCreator:", v18);
  v17.receiver = self;
  v17.super_class = (Class)HUScheduleDateEditorViewController;
  v13 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v17, sel_initWithItemManager_tableViewStyle_, v11, 1);
  v14 = v13;
  if (v13)
  {
    v13->_editorContext = a4;
    objc_storeWeak((id *)&v13->_delegate, v10);
  }

  return v14;
}

id __74__HUScheduleDateEditorViewController_initWithDate_editorContext_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HUScheduleDateEditorItemModule *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HUScheduleDateEditorItemModule initWithItemUpdater:date:editorContext:]([HUScheduleDateEditorItemModule alloc], "initWithItemUpdater:date:editorContext:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)viewDidLoad
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUScheduleDateEditorViewController;
  -[HUItemTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  if (-[HUScheduleDateEditorViewController editorContext](self, "editorContext"))
    v3 = CFSTR("HUScheduleRuleEditor_EndTime_Title");
  else
    v3 = CFSTR("HUScheduleRuleEditor_StartTime_Title");
  _HULocalizedStringWithDefaultValue(v3, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleDateEditorViewController setTitle:](self, "setTitle:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonPressed_);
  -[HUScheduleDateEditorViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v3;
  HUScheduleDateEditorItemModuleController *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Unexpected module %@"), v3);
  v4 = -[HUItemModuleController initWithModule:]([HUScheduleDateEditorItemModuleController alloc], "initWithModule:", v3);

  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;
  double v7;

  v5 = a3;
  if (objc_msgSend(a4, "row") == 2)
  {
    v6 = 380.0;
  }
  else
  {
    objc_msgSend(v5, "rowHeight");
    v6 = v7;
  }

  return v6;
}

- (void)doneButtonPressed:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  HUScheduleDateEditorViewController *v10;
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
  -[HUScheduleDateEditorViewController _saveChanges](self, "_saveChanges");
  -[HUScheduleDateEditorViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

}

- (void)_saveChanges
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  HUScheduleDateEditorViewController *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HUScheduleDateEditorViewController _editorItemModule](self, "_editorItemModule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUScheduleDateEditorViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "editedDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413058;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Notifying delegate [%@] of updated schedule rule date [%@]", (uint8_t *)&v11, 0x2Au);

  }
  objc_msgSend(v4, "editedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleDateEditorViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didUpdateDate:date:editorContext:", self, v9, objc_msgSend(v4, "editorContext"));

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
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_54);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __55__HUScheduleDateEditorViewController__editorItemModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)editorContext
{
  return self->_editorContext;
}

- (HUScheduleDateEditorViewControllerDelegate)delegate
{
  return (HUScheduleDateEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
