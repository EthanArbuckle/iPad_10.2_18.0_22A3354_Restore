@implementation HUScheduleRuleEditorItemModule

- (HUScheduleRuleEditorItemModule)initWithItemUpdater:(id)a3 scheduleType:(unint64_t)a4 scheduleRule:(id)a5 scheduleBuilder:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  HUScheduleRuleEditorItemModule *v15;
  HUScheduleRuleEditorItemModule *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  objc_super v22;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v11)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleRuleEditorItemModule.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemUpdater"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleRuleEditorItemModule.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scheduleBuilder"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)HUScheduleRuleEditorItemModule;
  v15 = -[HFItemModule initWithItemUpdater:](&v22, sel_initWithItemUpdater_, v11);
  v16 = v15;
  if (v15)
  {
    v15->_scheduleType = a4;
    objc_storeStrong((id *)&v15->_existingScheduleRule, a5);
    if (v12)
    {
      v17 = (void *)objc_msgSend(v12, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D31730], "defaultRuleForType:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    objc_storeStrong((id *)&v16->_editedScheduleRule, v17);

    objc_storeStrong((id *)&v16->_scheduleBuilder, a6);
    -[HUScheduleRuleEditorItemModule _buildItemProviders](v16, "_buildItemProviders");
  }

  return v16;
}

- (HUScheduleRuleEditorItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_scheduleType_scheduleRule_scheduleBuilder_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleRuleEditorItemModule.m"), 55, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUScheduleRuleEditorItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUScheduleRuleEditorItemModule staticItemProvider](self, "staticItemProvider");
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("HUScheduleRuleEditorSpecificDatesRuleSectionIdentifier"));
  if (-[HUScheduleRuleEditorItemModule scheduleType](self, "scheduleType") == 1)
  {
    v7 = (void *)objc_opt_new();
    -[HUScheduleRuleEditorItemModule editStartDatePeriodItem](self, "editStartDatePeriodItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v8);

    -[HUScheduleRuleEditorItemModule editEndDatePeriodItem](self, "editEndDatePeriodItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeAddObject:", v9);

    objc_msgSend(v6, "setItems:", v7);
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUScheduleRuleEditorCustomScheduleRuleSectionIdentifier"));
  if (-[HUScheduleRuleEditorItemModule scheduleType](self, "scheduleType") == 2)
  {
    v11 = (void *)objc_opt_new();
    -[HUScheduleRuleEditorItemModule allDayItem](self, "allDayItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_safeAddObject:", v12);

    -[HUScheduleRuleEditorItemModule editTimeOfDayItem](self, "editTimeOfDayItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_safeAddObject:", v13);

    -[HUScheduleRuleEditorItemModule editRecurrenceItem](self, "editRecurrenceItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_safeAddObject:", v14);

    objc_msgSend(v10, "setItems:", v11);
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUScheduleRuleEditorRemoveRuleSectionIdentifier"));
  -[HUScheduleRuleEditorItemModule removeRuleItem](self, "removeRuleItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setItems:", v17);

  v18 = (void *)MEMORY[0x1E0D314B0];
  v22[0] = v6;
  v22[1] = v10;
  v22[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filterSections:toDisplayedItems:", v19, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)_buildItemProviders
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id (*v29)(uint64_t);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id location[2];

  objc_initWeak(location, self);
  v3 = (void *)objc_opt_new();
  v4 = -[HUScheduleRuleEditorItemModule scheduleType](self, "scheduleType");
  v5 = MEMORY[0x1E0C809B0];
  if (v4 == 1)
  {
    v6 = objc_alloc(MEMORY[0x1E0D31840]);
    v40[0] = v5;
    v40[1] = 3221225472;
    v40[2] = __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke;
    v40[3] = &unk_1E6F4C4E8;
    objc_copyWeak(&v41, location);
    v7 = (void *)objc_msgSend(v6, "initWithResultsBlock:", v40);
    -[HUScheduleRuleEditorItemModule setEditStartDatePeriodItem:](self, "setEditStartDatePeriodItem:", v7);

    -[HUScheduleRuleEditorItemModule editStartDatePeriodItem](self, "editStartDatePeriodItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

    v9 = objc_alloc(MEMORY[0x1E0D31840]);
    v38[0] = v5;
    v38[1] = 3221225472;
    v38[2] = __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_2;
    v38[3] = &unk_1E6F4C4E8;
    objc_copyWeak(&v39, location);
    v10 = (void *)objc_msgSend(v9, "initWithResultsBlock:", v38);
    -[HUScheduleRuleEditorItemModule setEditEndDatePeriodItem:](self, "setEditEndDatePeriodItem:", v10);

    -[HUScheduleRuleEditorItemModule editEndDatePeriodItem](self, "editEndDatePeriodItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
  }
  if (-[HUScheduleRuleEditorItemModule scheduleType](self, "scheduleType") == 2)
  {
    v12 = objc_alloc(MEMORY[0x1E0D31840]);
    v36[0] = v5;
    v36[1] = 3221225472;
    v36[2] = __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_3;
    v36[3] = &unk_1E6F4C4E8;
    objc_copyWeak(&v37, location);
    v13 = (void *)objc_msgSend(v12, "initWithResultsBlock:", v36);
    -[HUScheduleRuleEditorItemModule setAllDayItem:](self, "setAllDayItem:", v13);

    -[HUScheduleRuleEditorItemModule allDayItem](self, "allDayItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

    v15 = objc_alloc(MEMORY[0x1E0D31840]);
    v34[0] = v5;
    v34[1] = 3221225472;
    v34[2] = __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_4;
    v34[3] = &unk_1E6F4C4E8;
    objc_copyWeak(&v35, location);
    v16 = (void *)objc_msgSend(v15, "initWithResultsBlock:", v34);
    -[HUScheduleRuleEditorItemModule setEditTimeOfDayItem:](self, "setEditTimeOfDayItem:", v16);

    -[HUScheduleRuleEditorItemModule editTimeOfDayItem](self, "editTimeOfDayItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

    v18 = objc_alloc(MEMORY[0x1E0D31840]);
    v32[0] = v5;
    v32[1] = 3221225472;
    v32[2] = __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_5;
    v32[3] = &unk_1E6F4C4E8;
    objc_copyWeak(&v33, location);
    v19 = (void *)objc_msgSend(v18, "initWithResultsBlock:", v32);
    -[HUScheduleRuleEditorItemModule setEditRecurrenceItem:](self, "setEditRecurrenceItem:", v19);

    -[HUScheduleRuleEditorItemModule editRecurrenceItem](self, "editRecurrenceItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
  }
  v21 = objc_alloc(MEMORY[0x1E0D31840]);
  v27 = v5;
  v28 = 3221225472;
  v29 = __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_6;
  v30 = &unk_1E6F4C4E8;
  objc_copyWeak(&v31, location);
  v22 = (void *)objc_msgSend(v21, "initWithResultsBlock:", &v27);
  -[HUScheduleRuleEditorItemModule setRemoveRuleItem:](self, "setRemoveRuleItem:", v22, v27, v28, v29, v30);

  -[HUScheduleRuleEditorItemModule removeRuleItem](self, "removeRuleItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  v24 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithItems:", v25);
  -[HUScheduleRuleEditorItemModule setStaticItemProvider:](self, "setStaticItemProvider:", v26);

  objc_destroyWeak(&v31);
  objc_destroyWeak(location);
}

id __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
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
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "editedScheduleRule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "yearDayRule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "validFrom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "isDateInToday:", v5);

  if (v6)
  {
    HFLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(WeakRetained, "_datePeriodFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "editedScheduleRule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "yearDayRule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "validFrom");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = (void *)MEMORY[0x1E0D519C0];
  v18[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUScheduleRuleEditor_StartTime_Title"), CFSTR("HUScheduleRuleEditor_StartTime_Title"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "scheduleType") != 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = *MEMORY[0x1E0D30BF8];
  v19[1] = v14;
  v19[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
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
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "editedScheduleRule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "yearDayRule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "validUntil");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "isEqualToDate:", v5);

  if (v6)
  {
    HFLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(WeakRetained, "_datePeriodFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "editedScheduleRule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "yearDayRule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "validUntil");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = (void *)MEMORY[0x1E0D519C0];
  v18[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUScheduleRuleEditor_EndTime_Title"), CFSTR("HUScheduleRuleEditor_EndTime_Title"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "scheduleType") != 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = *MEMORY[0x1E0D30BF8];
  v19[1] = v14;
  v19[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "futureWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519C0];
  v11[0] = *MEMORY[0x1E0D30D18];
  HFLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "scheduleType") != 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = *MEMORY[0x1E0D30E20];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "editedScheduleRule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "isAllDayWeekDayRule");
  objc_msgSend(v5, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)MEMORY[0x1E0D519C0];
  v12[0] = *MEMORY[0x1E0D30D18];
  v4 = 1;
  _HULocalizedStringWithDefaultValue(CFSTR("HUScheduleRuleEditor_Between"), CFSTR("HUScheduleRuleEditor_Between"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = *MEMORY[0x1E0D30D70];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(WeakRetained, "scheduleType");
  if (v7 == 2)
  {
    objc_msgSend(WeakRetained, "editedScheduleRule");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v1, "isAllDayWeekDayRule");
  }
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == 2)
  return v10;
}

id __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_5(uint64_t a1)
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
  _HULocalizedStringWithDefaultValue(CFSTR("HUScheduleRuleEditor_Repeat"), CFSTR("HUScheduleRuleEditor_Repeat"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "scheduleType") != 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = *MEMORY[0x1E0D30BF8];
  objc_msgSend(WeakRetained, "_localizedNaturalLanguageStringForRecurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __53__HUScheduleRuleEditorItemModule__buildItemProviders__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scheduleBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(WeakRetained, "scheduleBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "minNumberOfRules");

  v7 = (void *)MEMORY[0x1E0D519C0];
  v18[0] = *MEMORY[0x1E0D30D18];
  if (objc_msgSend(WeakRetained, "scheduleType") == 2)
    v8 = CFSTR("HUScheduleRuleEditor_RemoveTimes");
  else
    v8 = CFSTR("HUScheduleRuleEditor_RemoveDates");
  _HULocalizedStringWithDefaultValue(v8, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v18[1] = *MEMORY[0x1E0D30D70];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "existingScheduleRule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = v4 == v6;
  else
    v12 = 1;
  v13 = v12;
  objc_msgSend(v10, "numberWithInt:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "futureWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_localizedNaturalLanguageStringForRecurrence
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *v14;
  void *v15;
  int v16;
  HUScheduleRuleEditorItemModule *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HUScheduleRuleEditorItemModule editedScheduleRule](self, "editedScheduleRule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isWeekDayRule");

  if ((v5 & 1) != 0)
  {
    -[HUScheduleRuleEditorItemModule editedScheduleRule](self, "editedScheduleRule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "weekDayRule");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "daysOfTheWeek");
    HMDaysOfTheWeekToDateComponents();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CBA910], "hf_recurrenceNaturalLanguageStringWithRecurrences:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E6F60E80;
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    return v12;
  }
  else
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = self;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Not a weekDayRule. Unabled to determine natural language string for recurrence.", (uint8_t *)&v16, 0x16u);

    }
    return &stru_1E6F60E80;
  }
}

- (BOOL)updateScheduleRuleStartDate:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int v23;
  HUScheduleRuleEditorItemModule *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUScheduleRuleEditorItemModule editedScheduleRule](self, "editedScheduleRule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "yearDayRule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "validFrom");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138413058;
    v24 = self;
    v25 = 2112;
    v26 = v7;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Requesting to update start date from %@ to %@", (uint8_t *)&v23, 0x2Au);

  }
  v11 = objc_alloc(MEMORY[0x1E0CBA978]);
  -[HUScheduleRuleEditorItemModule editedScheduleRule](self, "editedScheduleRule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "yearDayRule");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "validUntil");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithValidFrom:validUntil:", v5, v14);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31730]), "initWithYearDayRule:", v15);
  -[HUScheduleRuleEditorItemModule setEditedScheduleRule:](self, "setEditedScheduleRule:", v16);
  v17 = (void *)MEMORY[0x1E0D314C0];
  -[HUScheduleRuleEditorItemModule itemProviders](self, "itemProviders");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "requestToReloadItemProviders:senderSelector:", v18, a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "performItemUpdateRequest:", v19);

  return 1;
}

- (BOOL)updateScheduleRuleEndDate:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int v23;
  HUScheduleRuleEditorItemModule *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUScheduleRuleEditorItemModule editedScheduleRule](self, "editedScheduleRule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "yearDayRule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "validUntil");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138413058;
    v24 = self;
    v25 = 2112;
    v26 = v7;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Requesting to update end date from %@ to %@", (uint8_t *)&v23, 0x2Au);

  }
  v11 = objc_alloc(MEMORY[0x1E0CBA978]);
  -[HUScheduleRuleEditorItemModule editedScheduleRule](self, "editedScheduleRule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "yearDayRule");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "validFrom");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithValidFrom:validUntil:", v14, v5);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31730]), "initWithYearDayRule:", v15);
  -[HUScheduleRuleEditorItemModule setEditedScheduleRule:](self, "setEditedScheduleRule:", v16);
  v17 = (void *)MEMORY[0x1E0D314C0];
  -[HUScheduleRuleEditorItemModule itemProviders](self, "itemProviders");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "requestToReloadItemProviders:senderSelector:", v18, a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "performItemUpdateRequest:", v19);

  return 1;
}

- (BOOL)updateScheduleRuleStartTime:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  HUScheduleRuleEditorItemModule *v13;
  __int16 v14;
  void *v15;
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
    -[HUScheduleRuleEditorItemModule editedScheduleRule](self, "editedScheduleRule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "weekDayRule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Requesting to update start time from %@ to %@", (uint8_t *)&v12, 0x2Au);

  }
  -[HUScheduleRuleEditorItemModule setEditedStartTime:](self, "setEditedStartTime:", v5);

  return 1;
}

- (BOOL)updateScheduleRuleEndTime:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  HUScheduleRuleEditorItemModule *v13;
  __int16 v14;
  void *v15;
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
    -[HUScheduleRuleEditorItemModule editedScheduleRule](self, "editedScheduleRule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "weekDayRule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Requesting to update end time from %@ to %@", (uint8_t *)&v12, 0x2Au);

  }
  -[HUScheduleRuleEditorItemModule setEditedEndTime:](self, "setEditedEndTime:", v5);

  return 1;
}

- (BOOL)updateScheduleRuleRecurrences:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
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
  id v28;
  SEL v30;
  uint8_t buf[4];
  HUScheduleRuleEditorItemModule *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "hmf_isEmpty") & 1) == 0)
  {
    v8 = HMDaysOfTheWeekFromDateComponents();
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUScheduleRuleEditorItemModule editedScheduleRule](self, "editedScheduleRule");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "weekDayRule");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "daysOfTheWeek");
      HMDaysOfTheWeekToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMDaysOfTheWeekToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v32 = self;
      v33 = 2112;
      v34 = v10;
      v35 = 2112;
      v36 = v13;
      v37 = 2112;
      v38 = v14;
      v39 = 1024;
      v40 = 0;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating schedule days of the week from %@ to %@ | validatedWeekDays = %{BOOL}d", buf, 0x30u);

    }
    v15 = objc_alloc(MEMORY[0x1E0CBA960]);
    -[HUScheduleRuleEditorItemModule editedScheduleRule](self, "editedScheduleRule");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "weekDayRule");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUScheduleRuleEditorItemModule editedScheduleRule](self, "editedScheduleRule");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "weekDayRule");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "endTime");
    v30 = a2;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v15, "initWithStartTime:endTime:daysOfTheWeek:", v18, v21, v8);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31730]), "initWithWeekDayRule:", v22);
    -[HUScheduleRuleEditorItemModule setEditedScheduleRule:](self, "setEditedScheduleRule:", v23);
    v24 = (void *)MEMORY[0x1E0D314C0];
    -[HUScheduleRuleEditorItemModule itemProviders](self, "itemProviders");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "requestToReloadItemProviders:senderSelector:", v25, v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFItemModule itemUpdater](self, "itemUpdater");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend(v27, "performItemUpdateRequest:", v26);

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateAllDayToggle:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  int v25;
  HUScheduleRuleEditorItemModule *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hf_componentsWithHour:minute:", 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99D78];
    v7 = 23;
    v8 = 59;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hf_componentsWithHour:minute:", 9, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99D78];
    v7 = 17;
    v8 = 0;
  }
  objc_msgSend(v6, "hf_componentsWithHour:minute:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleRuleEditorItemModule updateScheduleRuleStartTime:](self, "updateScheduleRuleStartTime:", v5);
  -[HUScheduleRuleEditorItemModule updateScheduleRuleEndTime:](self, "updateScheduleRuleEndTime:", v9);
  v10 = objc_alloc(MEMORY[0x1E0CBA960]);
  -[HUScheduleRuleEditorItemModule editedScheduleRule](self, "editedScheduleRule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "weekDayRule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithStartTime:endTime:daysOfTheWeek:", v5, v9, objc_msgSend(v12, "daysOfTheWeek"));

  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412802;
    v26 = self;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ New weekDay schedule rule will be %@", (uint8_t *)&v25, 0x20u);

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31730]), "initWithWeekDayRule:", v13);
  HFLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUScheduleRuleEditorItemModule editedScheduleRule](self, "editedScheduleRule");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138413058;
    v26 = self;
    v27 = 2112;
    v28 = v18;
    v29 = 2112;
    v30 = v19;
    v31 = 2112;
    v32 = v16;
    _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating from schedule rule %@ to %@", (uint8_t *)&v25, 0x2Au);

  }
  -[HUScheduleRuleEditorItemModule setEditedScheduleRule:](self, "setEditedScheduleRule:", v16);
  v20 = (void *)MEMORY[0x1E0D314C0];
  -[HUScheduleRuleEditorItemModule itemProviders](self, "itemProviders");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "requestToReloadItemProviders:senderSelector:", v21, a2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v23, "performItemUpdateRequest:", v22);

}

- (id)_datePeriodFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateStyle:", 2);
  objc_msgSend(v2, "setTimeStyle:", 0);
  return v2;
}

- (unint64_t)scheduleType
{
  return self->_scheduleType;
}

- (HFScheduleBuilder)scheduleBuilder
{
  return self->_scheduleBuilder;
}

- (HFScheduleRule)existingScheduleRule
{
  return self->_existingScheduleRule;
}

- (HFScheduleRule)editedScheduleRule
{
  return self->_editedScheduleRule;
}

- (void)setEditedScheduleRule:(id)a3
{
  objc_storeStrong((id *)&self->_editedScheduleRule, a3);
}

- (NSDateComponents)editedStartTime
{
  return self->_editedStartTime;
}

- (void)setEditedStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_editedStartTime, a3);
}

- (NSDateComponents)editedEndTime
{
  return self->_editedEndTime;
}

- (void)setEditedEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_editedEndTime, a3);
}

- (HFItem)editStartDatePeriodItem
{
  return self->_editStartDatePeriodItem;
}

- (void)setEditStartDatePeriodItem:(id)a3
{
  objc_storeStrong((id *)&self->_editStartDatePeriodItem, a3);
}

- (HFItem)editEndDatePeriodItem
{
  return self->_editEndDatePeriodItem;
}

- (void)setEditEndDatePeriodItem:(id)a3
{
  objc_storeStrong((id *)&self->_editEndDatePeriodItem, a3);
}

- (HFItem)allDayItem
{
  return self->_allDayItem;
}

- (void)setAllDayItem:(id)a3
{
  objc_storeStrong((id *)&self->_allDayItem, a3);
}

- (HFItem)editTimeOfDayItem
{
  return self->_editTimeOfDayItem;
}

- (void)setEditTimeOfDayItem:(id)a3
{
  objc_storeStrong((id *)&self->_editTimeOfDayItem, a3);
}

- (HFItem)editRecurrenceItem
{
  return self->_editRecurrenceItem;
}

- (void)setEditRecurrenceItem:(id)a3
{
  objc_storeStrong((id *)&self->_editRecurrenceItem, a3);
}

- (HFItem)removeRuleItem
{
  return self->_removeRuleItem;
}

- (void)setRemoveRuleItem:(id)a3
{
  objc_storeStrong((id *)&self->_removeRuleItem, a3);
}

- (HFItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_removeRuleItem, 0);
  objc_storeStrong((id *)&self->_editRecurrenceItem, 0);
  objc_storeStrong((id *)&self->_editTimeOfDayItem, 0);
  objc_storeStrong((id *)&self->_allDayItem, 0);
  objc_storeStrong((id *)&self->_editEndDatePeriodItem, 0);
  objc_storeStrong((id *)&self->_editStartDatePeriodItem, 0);
  objc_storeStrong((id *)&self->_editedEndTime, 0);
  objc_storeStrong((id *)&self->_editedStartTime, 0);
  objc_storeStrong((id *)&self->_editedScheduleRule, 0);
  objc_storeStrong((id *)&self->_existingScheduleRule, 0);
  objc_storeStrong((id *)&self->_scheduleBuilder, 0);
}

@end
