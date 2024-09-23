@implementation HUScheduleRecurrenceEditorItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[HUScheduleRecurrenceEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dailyOptionItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v6))
  {

  }
  else
  {
    objc_msgSend(v5, "weeklyOptionItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v5, "daysOfWeekPickerItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "isEqual:", v9);

    }
  }
  objc_opt_class();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUScheduleRecurrenceEditorItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v14, sel_setupCell_forItem_, v6, a4);
  -[HUScheduleRecurrenceEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v7, "initialRecurrences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSelectedRecurrences:", v13);

    objc_msgSend(v10, "setDelegate:", self);
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_super v20;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUScheduleRecurrenceEditorItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v20, sel_updateCell_forItem_animated_, v8, v9, v5);
  -[HUScheduleRecurrenceEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    objc_msgSend(v10, "dailyOptionItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqual:", v14))
    {

    }
    else
    {
      objc_msgSend(v10, "weeklyOptionItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v9, "isEqual:", v15);

      if (!v16)
        goto LABEL_12;
    }
    objc_msgSend(v9, "latestResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "BOOLValue"))
      v19 = 3;
    else
      v19 = 0;
    objc_msgSend(v13, "setAccessoryType:", v19);

    objc_msgSend(v13, "setDisabled:", 0);
  }
LABEL_12:

}

- (unint64_t)didSelectItem:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  int v14;
  HUScheduleRecurrenceEditorItemModuleController *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = self;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User selected item [%@]", (uint8_t *)&v14, 0x20u);

  }
  -[HUScheduleRecurrenceEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dailyOptionItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqual:", v9);

  if (v10)
  {
    objc_msgSend(v8, "updateToDailyRecurrenceOption");
  }
  else
  {
    objc_msgSend(v8, "weeklyOptionItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "isEqual:", v11);

    if (v12)
      objc_msgSend(v8, "updateToWeeklyRecurrenceOption");
  }

  return 0;
}

- (void)dayOfWeekPickerCell:(id)a3 didChangeSelectedRecurrences:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  HUScheduleRecurrenceEditorItemModuleController *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HUScheduleRecurrenceEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "editedRecurrences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = self;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ User changed selected recurrences from [%@] to [%@]", (uint8_t *)&v12, 0x2Au);

  }
  objc_msgSend(v6, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEditedRecurrences:", v11);

}

- (id)_editorItemModule
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

@end
