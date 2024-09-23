@implementation HUScheduleDateEditorItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  char v11;
  void *v12;

  v4 = a3;
  -[HUScheduleDateEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTodayDateItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v6) & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v5, "endNeverDateItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v7))
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(v5, "specificDateItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v5, "datePickerItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isEqual:", v12);

  }
LABEL_5:
  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v8;
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
  void *v14;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUScheduleDateEditorItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v15, sel_setupCell_forItem_, v6, a4);
  -[HUScheduleDateEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v8 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "toggleTimePickerOptionVisibility:", 0);
    objc_msgSend(v10, "setHideTitleLabel:", 1);
    objc_msgSend(v7, "existingDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToDate:", v12) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "hf_endOfDay");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "existingDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v10, "setDateAndTimePickerDate:", v14);
    objc_msgSend(v7, "setEditedDate:", v14);
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
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  objc_super v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUScheduleDateEditorItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v21, sel_updateCell_forItem_animated_, v8, v9, v5);
  -[HUScheduleDateEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
    goto LABEL_13;
  objc_msgSend(v10, "startTodayDateItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v14) & 1) == 0)
  {
    objc_msgSend(v10, "endNeverDateItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqual:", v15))
    {
      objc_msgSend(v10, "specificDateItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v9, "isEqual:", v19);

      if ((v20 & 1) == 0)
        goto LABEL_13;
      goto LABEL_9;
    }

  }
LABEL_9:
  objc_msgSend(v9, "latestResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "BOOLValue"))
    v18 = 3;
  else
    v18 = 0;
  objc_msgSend(v13, "setAccessoryType:", v18);

  objc_msgSend(v13, "setDisabled:", 0);
LABEL_13:

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
  void *v13;
  int v14;
  int v16;
  HUScheduleDateEditorItemModuleController *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = self;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User selected item [%@]", (uint8_t *)&v16, 0x20u);

  }
  -[HUScheduleDateEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startTodayDateItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqual:", v9);

  if (v10)
  {
    objc_msgSend(v8, "updateToTodayDateOption");
  }
  else
  {
    objc_msgSend(v8, "endNeverDateItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "isEqual:", v11);

    if (v12)
    {
      objc_msgSend(v8, "updateToNeverDateOption");
    }
    else
    {
      objc_msgSend(v8, "specificDateItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v5, "isEqual:", v13);

      if (v14)
        objc_msgSend(v8, "updateToSpecificDateOption");
    }
  }

  return 0;
}

- (void)dateAndTimePickerCell:(id)a3 didSelectDate:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  HUScheduleDateEditorItemModuleController *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ User selected date [%@] from calendar picker.", (uint8_t *)&v10, 0x20u);

  }
  -[HUScheduleDateEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEditedDate:", v6);

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
