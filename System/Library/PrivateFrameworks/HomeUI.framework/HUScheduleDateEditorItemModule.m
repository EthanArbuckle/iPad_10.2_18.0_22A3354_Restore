@implementation HUScheduleDateEditorItemModule

- (HUScheduleDateEditorItemModule)initWithItemUpdater:(id)a3 date:(id)a4 editorContext:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  HUScheduleDateEditorItemModule *v12;
  HUScheduleDateEditorItemModule *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleDateEditorItemModule.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemUpdater"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleDateEditorItemModule.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)HUScheduleDateEditorItemModule;
  v12 = -[HFItemModule initWithItemUpdater:](&v17, sel_initWithItemUpdater_, v9);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_existingDate, a4);
    objc_storeStrong((id *)&v13->_editedDate, a4);
    v13->_editorContext = a5;
    -[HUScheduleDateEditorItemModule _buildItemProviders](v13, "_buildItemProviders");
  }

  return v13;
}

- (HUScheduleDateEditorItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_date_editorContext_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleDateEditorItemModule.m"), 47, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUScheduleDateEditorItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUScheduleDateEditorItemModule staticItemProvider](self, "staticItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("HUScheduleDateEditorDateSectionIdentifier"));
  v7 = (void *)objc_opt_new();
  -[HUScheduleDateEditorItemModule startTodayDateItem](self, "startTodayDateItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObject:", v8);

  -[HUScheduleDateEditorItemModule endNeverDateItem](self, "endNeverDateItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObject:", v9);

  -[HUScheduleDateEditorItemModule specificDateItem](self, "specificDateItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObject:", v10);

  -[HUScheduleDateEditorItemModule datePickerItem](self, "datePickerItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObject:", v11);

  objc_msgSend(v6, "setItems:", v7);
  v12 = (void *)MEMORY[0x1E0D314B0];
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filterSections:toDisplayedItems:", v13, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_buildItemProviders
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_opt_new();
  -[HUScheduleDateEditorItemModule _configureSelectedOptions](self, "_configureSelectedOptions");
  v4 = objc_alloc(MEMORY[0x1E0D31840]);
  v5 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke;
  v26[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v27, &location);
  v6 = (void *)objc_msgSend(v4, "initWithResultsBlock:", v26);
  -[HUScheduleDateEditorItemModule setStartTodayDateItem:](self, "setStartTodayDateItem:", v6);

  -[HUScheduleDateEditorItemModule startTodayDateItem](self, "startTodayDateItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = objc_alloc(MEMORY[0x1E0D31840]);
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke_2;
  v24[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v25, &location);
  v9 = (void *)objc_msgSend(v8, "initWithResultsBlock:", v24);
  -[HUScheduleDateEditorItemModule setEndNeverDateItem:](self, "setEndNeverDateItem:", v9);

  -[HUScheduleDateEditorItemModule endNeverDateItem](self, "endNeverDateItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = objc_alloc(MEMORY[0x1E0D31840]);
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke_3;
  v22[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v23, &location);
  v12 = (void *)objc_msgSend(v11, "initWithResultsBlock:", v22);
  -[HUScheduleDateEditorItemModule setSpecificDateItem:](self, "setSpecificDateItem:", v12);

  -[HUScheduleDateEditorItemModule specificDateItem](self, "specificDateItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = objc_alloc(MEMORY[0x1E0D31840]);
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke_4;
  v20[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v21, &location);
  v15 = (void *)objc_msgSend(v14, "initWithResultsBlock:", v20);
  -[HUScheduleDateEditorItemModule setDatePickerItem:](self, "setDatePickerItem:", v15);

  -[HUScheduleDateEditorItemModule datePickerItem](self, "datePickerItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithItems:", v18);
  -[HUScheduleDateEditorItemModule setStaticItemProvider:](self, "setStaticItemProvider:", v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&location);
}

id __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = *MEMORY[0x1E0D30D18];
  HFLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E0D30DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isTodayOptionSelected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "editorContext") != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = *MEMORY[0x1E0D30D18];
  HFLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E0D30DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isNeverOptionSelected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "editorContext") != 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUScheduleRuleEditor_OnDate"), CFSTR("HUScheduleRuleEditor_OnDate"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = *MEMORY[0x1E0D30DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isSpecificDateOptionSelected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = *MEMORY[0x1E0D30D70];
  v9[1] = v4;
  v9[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __53__HUScheduleDateEditorItemModule__buildItemProviders__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519C0];
  v9 = *MEMORY[0x1E0D30D70];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  if ((objc_msgSend(WeakRetained, "isTodayOptionSelected") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(WeakRetained, "isNeverOptionSelected");
  objc_msgSend(v3, "numberWithInt:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateToTodayDateOption
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[HUScheduleDateEditorItemModule setIsTodayOptionSelected:](self, "setIsTodayOptionSelected:", 1);
  -[HUScheduleDateEditorItemModule setIsSpecificDateOptionSelected:](self, "setIsSpecificDateOptionSelected:", -[HUScheduleDateEditorItemModule isTodayOptionSelected](self, "isTodayOptionSelected") ^ 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_startOfDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleDateEditorItemModule setEditedDate:](self, "setEditedDate:", v5);

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D314C0];
  -[HUScheduleDateEditorItemModule itemProviders](self, "itemProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestToReloadItemProviders:senderSelector:", v7, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v10, "performItemUpdateRequest:", v8);

}

- (void)updateToNeverDateOption
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[HUScheduleDateEditorItemModule setIsNeverOptionSelected:](self, "setIsNeverOptionSelected:", 1);
  -[HUScheduleDateEditorItemModule setIsSpecificDateOptionSelected:](self, "setIsSpecificDateOptionSelected:", -[HUScheduleDateEditorItemModule isNeverOptionSelected](self, "isNeverOptionSelected") ^ 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleDateEditorItemModule setEditedDate:](self, "setEditedDate:", v4);

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D314C0];
  -[HUScheduleDateEditorItemModule itemProviders](self, "itemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestToReloadItemProviders:senderSelector:", v6, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v9, "performItemUpdateRequest:", v7);

}

- (void)updateToSpecificDateOption
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (!-[HUScheduleDateEditorItemModule editorContext](self, "editorContext"))
  {
    -[HUScheduleDateEditorItemModule setIsTodayOptionSelected:](self, "setIsTodayOptionSelected:", 0);
    v4 = -[HUScheduleDateEditorItemModule isTodayOptionSelected](self, "isTodayOptionSelected");
    goto LABEL_5;
  }
  if (-[HUScheduleDateEditorItemModule editorContext](self, "editorContext") == 1)
  {
    -[HUScheduleDateEditorItemModule setIsNeverOptionSelected:](self, "setIsNeverOptionSelected:", 0);
    v4 = -[HUScheduleDateEditorItemModule isNeverOptionSelected](self, "isNeverOptionSelected");
LABEL_5:
    -[HUScheduleDateEditorItemModule setIsSpecificDateOptionSelected:](self, "setIsSpecificDateOptionSelected:", !v4);
  }
  -[HFItemModule itemUpdater](self, "itemUpdater");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D314C0];
  -[HUScheduleDateEditorItemModule itemProviders](self, "itemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestToReloadItemProviders:senderSelector:", v6, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v9, "performItemUpdateRequest:", v7);

}

- (void)_configureSelectedOptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (-[HUScheduleDateEditorItemModule editorContext](self, "editorContext"))
  {
    if (-[HUScheduleDateEditorItemModule editorContext](self, "editorContext") != 1)
      return;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUScheduleDateEditorItemModule existingDate](self, "existingDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToDate:", v4);

    -[HUScheduleDateEditorItemModule setIsNeverOptionSelected:](self, "setIsNeverOptionSelected:", v5);
    v6 = -[HUScheduleDateEditorItemModule isNeverOptionSelected](self, "isNeverOptionSelected");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUScheduleDateEditorItemModule existingDate](self, "existingDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isDateInToday:", v8);

    -[HUScheduleDateEditorItemModule setIsTodayOptionSelected:](self, "setIsTodayOptionSelected:", v9);
    v6 = -[HUScheduleDateEditorItemModule isTodayOptionSelected](self, "isTodayOptionSelected");
  }
  -[HUScheduleDateEditorItemModule setIsSpecificDateOptionSelected:](self, "setIsSpecificDateOptionSelected:", !v6);
}

- (NSDate)existingDate
{
  return self->_existingDate;
}

- (NSDate)editedDate
{
  return self->_editedDate;
}

- (void)setEditedDate:(id)a3
{
  objc_storeStrong((id *)&self->_editedDate, a3);
}

- (HFItem)startTodayDateItem
{
  return self->_startTodayDateItem;
}

- (void)setStartTodayDateItem:(id)a3
{
  objc_storeStrong((id *)&self->_startTodayDateItem, a3);
}

- (HFItem)endNeverDateItem
{
  return self->_endNeverDateItem;
}

- (void)setEndNeverDateItem:(id)a3
{
  objc_storeStrong((id *)&self->_endNeverDateItem, a3);
}

- (HFItem)specificDateItem
{
  return self->_specificDateItem;
}

- (void)setSpecificDateItem:(id)a3
{
  objc_storeStrong((id *)&self->_specificDateItem, a3);
}

- (HFItem)datePickerItem
{
  return self->_datePickerItem;
}

- (void)setDatePickerItem:(id)a3
{
  objc_storeStrong((id *)&self->_datePickerItem, a3);
}

- (unint64_t)editorContext
{
  return self->_editorContext;
}

- (HFItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (BOOL)isTodayOptionSelected
{
  return self->_isTodayOptionSelected;
}

- (void)setIsTodayOptionSelected:(BOOL)a3
{
  self->_isTodayOptionSelected = a3;
}

- (BOOL)isNeverOptionSelected
{
  return self->_isNeverOptionSelected;
}

- (void)setIsNeverOptionSelected:(BOOL)a3
{
  self->_isNeverOptionSelected = a3;
}

- (BOOL)isSpecificDateOptionSelected
{
  return self->_isSpecificDateOptionSelected;
}

- (void)setIsSpecificDateOptionSelected:(BOOL)a3
{
  self->_isSpecificDateOptionSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_datePickerItem, 0);
  objc_storeStrong((id *)&self->_specificDateItem, 0);
  objc_storeStrong((id *)&self->_endNeverDateItem, 0);
  objc_storeStrong((id *)&self->_startTodayDateItem, 0);
  objc_storeStrong((id *)&self->_editedDate, 0);
  objc_storeStrong((id *)&self->_existingDate, 0);
}

@end
