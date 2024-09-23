@implementation HUScheduleRecurrenceEditorItemModule

- (HUScheduleRecurrenceEditorItemModule)initWithItemUpdater:(id)a3 recurrences:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HUScheduleRecurrenceEditorItemModule *v10;
  HUScheduleRecurrenceEditorItemModule *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleRecurrenceEditorItemModule.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemUpdater"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleRecurrenceEditorItemModule.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recurrences"));

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)HUScheduleRecurrenceEditorItemModule;
  v10 = -[HFItemModule initWithItemUpdater:](&v15, sel_initWithItemUpdater_, v7);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_initialRecurrences, a4);
    objc_storeStrong((id *)&v11->_editedRecurrences, a4);
    -[HUScheduleRecurrenceEditorItemModule _buildItemProviders](v11, "_buildItemProviders");
  }

  return v11;
}

- (HUScheduleRecurrenceEditorItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_recurrences_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleRecurrenceEditorItemModule.m"), 42, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUScheduleRecurrenceEditorItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUScheduleRecurrenceEditorItemModule staticItemProvider](self, "staticItemProvider");
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
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("HUScheduleRecurrenceEditorOptionSectionIdentifier"));
  v7 = (void *)objc_opt_new();
  -[HUScheduleRecurrenceEditorItemModule dailyOptionItem](self, "dailyOptionItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  -[HUScheduleRecurrenceEditorItemModule weeklyOptionItem](self, "weeklyOptionItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

  objc_msgSend(v6, "setItems:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUScheduleRecurrenceEditorPickerSectionIdentifier"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUScheduleRuleEditor_DaysOfWeekPicker_HeaderTitle"), CFSTR("HUScheduleRuleEditor_DaysOfWeekPicker_HeaderTitle"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHeaderTitle:", v11);

  -[HUScheduleRecurrenceEditorItemModule daysOfWeekPickerItem](self, "daysOfWeekPickerItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setItems:", v13);

  v14 = (void *)MEMORY[0x1E0D314B0];
  v18[0] = v6;
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filterSections:toDisplayedItems:", v15, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_buildItemProviders
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];

  v3 = (void *)objc_opt_new();
  -[HUScheduleRecurrenceEditorItemModule initialRecurrences](self, "initialRecurrences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleRecurrenceEditorItemModule setIsDailyRecurrenceOptionSelected:](self, "setIsDailyRecurrenceOptionSelected:", objc_msgSend(v4, "count") == 7);

  -[HUScheduleRecurrenceEditorItemModule setIsWeeklyRecurrenceOptionSelected:](self, "setIsWeeklyRecurrenceOptionSelected:", -[HUScheduleRecurrenceEditorItemModule isDailyRecurrenceOptionSelected](self, "isDailyRecurrenceOptionSelected") ^ 1);
  v5 = objc_alloc(MEMORY[0x1E0D31840]);
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__HUScheduleRecurrenceEditorItemModule__buildItemProviders__block_invoke;
  v18[3] = &unk_1E6F4C518;
  v18[4] = self;
  v7 = (void *)objc_msgSend(v5, "initWithResultsBlock:", v18);
  -[HUScheduleRecurrenceEditorItemModule setDailyOptionItem:](self, "setDailyOptionItem:", v7);

  -[HUScheduleRecurrenceEditorItemModule dailyOptionItem](self, "dailyOptionItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __59__HUScheduleRecurrenceEditorItemModule__buildItemProviders__block_invoke_2;
  v17[3] = &unk_1E6F4C518;
  v17[4] = self;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", v17);
  -[HUScheduleRecurrenceEditorItemModule setWeeklyOptionItem:](self, "setWeeklyOptionItem:", v9);

  -[HUScheduleRecurrenceEditorItemModule weeklyOptionItem](self, "weeklyOptionItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __59__HUScheduleRecurrenceEditorItemModule__buildItemProviders__block_invoke_3;
  v16[3] = &unk_1E6F4C518;
  v16[4] = self;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", v16);
  -[HUScheduleRecurrenceEditorItemModule setDaysOfWeekPickerItem:](self, "setDaysOfWeekPickerItem:", v11);

  -[HUScheduleRecurrenceEditorItemModule daysOfWeekPickerItem](self, "daysOfWeekPickerItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithItems:", v14);
  -[HUScheduleRecurrenceEditorItemModule setStaticItemProvider:](self, "setStaticItemProvider:", v15);

}

id __59__HUScheduleRecurrenceEditorItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  v10[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUScheduleRuleEditor_Repeat_Daily"), CFSTR("HUScheduleRuleEditor_Repeat_Daily"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D30D70];
  v11[0] = v3;
  v11[1] = MEMORY[0x1E0C9AAA0];
  v5 = *MEMORY[0x1E0D30DA0];
  v10[1] = v4;
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isDailyRecurrenceOptionSelected"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __59__HUScheduleRecurrenceEditorItemModule__buildItemProviders__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  v10[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUScheduleRuleEditor_Repeat_Weekly"), CFSTR("HUScheduleRuleEditor_Repeat_Weekly"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D30D70];
  v11[0] = v3;
  v11[1] = MEMORY[0x1E0C9AAA0];
  v5 = *MEMORY[0x1E0D30DA0];
  v10[1] = v4;
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isWeeklyRecurrenceOptionSelected"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __59__HUScheduleRecurrenceEditorItemModule__buildItemProviders__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0D519C0];
  v6 = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isDailyRecurrenceOptionSelected"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateToDailyRecurrenceOption
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  HUScheduleRecurrenceEditorItemModule *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating to daily recurrence option", (uint8_t *)&v12, 0x16u);

  }
  -[HUScheduleRecurrenceEditorItemModule setIsDailyRecurrenceOptionSelected:](self, "setIsDailyRecurrenceOptionSelected:", 1);
  -[HUScheduleRecurrenceEditorItemModule setIsWeeklyRecurrenceOptionSelected:](self, "setIsWeeklyRecurrenceOptionSelected:", -[HUScheduleRecurrenceEditorItemModule isDailyRecurrenceOptionSelected](self, "isDailyRecurrenceOptionSelected") ^ 1);
  HMDaysOfTheWeekToDateComponents();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleRecurrenceEditorItemModule setEditedRecurrences:](self, "setEditedRecurrences:", v6);

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D314C0];
  -[HUScheduleRecurrenceEditorItemModule itemProviders](self, "itemProviders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestToReloadItemProviders:senderSelector:", v9, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "performItemUpdateRequest:", v10);

}

- (void)updateToWeeklyRecurrenceOption
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  HUScheduleRecurrenceEditorItemModule *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating to weekly recurrence option", (uint8_t *)&v11, 0x16u);

  }
  -[HUScheduleRecurrenceEditorItemModule setIsDailyRecurrenceOptionSelected:](self, "setIsDailyRecurrenceOptionSelected:", 0);
  -[HUScheduleRecurrenceEditorItemModule setIsWeeklyRecurrenceOptionSelected:](self, "setIsWeeklyRecurrenceOptionSelected:", -[HUScheduleRecurrenceEditorItemModule isDailyRecurrenceOptionSelected](self, "isDailyRecurrenceOptionSelected") ^ 1);
  -[HFItemModule itemUpdater](self, "itemUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D314C0];
  -[HUScheduleRecurrenceEditorItemModule itemProviders](self, "itemProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestToReloadItemProviders:senderSelector:", v8, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "performItemUpdateRequest:", v9);

}

- (NSArray)initialRecurrences
{
  return self->_initialRecurrences;
}

- (void)setInitialRecurrences:(id)a3
{
  objc_storeStrong((id *)&self->_initialRecurrences, a3);
}

- (NSArray)editedRecurrences
{
  return self->_editedRecurrences;
}

- (void)setEditedRecurrences:(id)a3
{
  objc_storeStrong((id *)&self->_editedRecurrences, a3);
}

- (HFItem)dailyOptionItem
{
  return self->_dailyOptionItem;
}

- (void)setDailyOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_dailyOptionItem, a3);
}

- (HFItem)weeklyOptionItem
{
  return self->_weeklyOptionItem;
}

- (void)setWeeklyOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_weeklyOptionItem, a3);
}

- (HFItem)daysOfWeekPickerItem
{
  return self->_daysOfWeekPickerItem;
}

- (void)setDaysOfWeekPickerItem:(id)a3
{
  objc_storeStrong((id *)&self->_daysOfWeekPickerItem, a3);
}

- (HFItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (BOOL)isDailyRecurrenceOptionSelected
{
  return self->_isDailyRecurrenceOptionSelected;
}

- (void)setIsDailyRecurrenceOptionSelected:(BOOL)a3
{
  self->_isDailyRecurrenceOptionSelected = a3;
}

- (BOOL)isWeeklyRecurrenceOptionSelected
{
  return self->_isWeeklyRecurrenceOptionSelected;
}

- (void)setIsWeeklyRecurrenceOptionSelected:(BOOL)a3
{
  self->_isWeeklyRecurrenceOptionSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_daysOfWeekPickerItem, 0);
  objc_storeStrong((id *)&self->_weeklyOptionItem, 0);
  objc_storeStrong((id *)&self->_dailyOptionItem, 0);
  objc_storeStrong((id *)&self->_editedRecurrences, 0);
  objc_storeStrong((id *)&self->_initialRecurrences, 0);
}

@end
