@implementation HUScheduleRuleEditorItemModuleController

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
  char v13;
  void *v14;
  char v15;
  void *v16;

  v4 = a3;
  -[HUScheduleRuleEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editStartDatePeriodItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", v6) & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v5, "editEndDatePeriodItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v7))
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(v5, "editRecurrenceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v5, "allDayItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "isEqual:", v12);

    if ((v13 & 1) == 0)
    {
      objc_msgSend(v5, "editTimeOfDayItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v4, "isEqual:", v14);

      if ((v15 & 1) == 0)
      {
        objc_msgSend(v5, "removeRuleItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "isEqual:", v16);

      }
    }
  }
LABEL_5:
  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HUScheduleRuleEditorItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v26, sel_setupCell_forItem_, v6, v7);
  -[HUScheduleRuleEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v8, "editTimeOfDayItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqual:", v12);

  if (v13 && v11)
  {
    objc_msgSend(v8, "editedStartTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v8, "editedScheduleRule");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "weekDayRule");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "startTime");
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "editedEndTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      objc_msgSend(v8, "editedScheduleRule");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "weekDayRule");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "endTime");
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "setStartTimeComponents:", v16);
    objc_msgSend(v11, "setEndTimeComponents:", v21);
    objc_msgSend(v7, "latestResults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v25);

    objc_msgSend(v11, "setDelegate:", self);
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
  id v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  char v27;
  objc_super v28;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HUScheduleRuleEditorItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v28, sel_updateCell_forItem_animated_, v8, v9, v5);
  -[HUScheduleRuleEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (!v13)
    goto LABEL_10;
  objc_msgSend(v10, "editStartDatePeriodItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v14) & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v10, "editEndDatePeriodItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v15))
  {

LABEL_8:
LABEL_9:
    objc_msgSend(v13, "setAccessoryView:", 0);
    objc_msgSend(v13, "setHideIcon:", 1);
    objc_msgSend(v13, "setAccessoryType:", 1);
    objc_msgSend(v13, "setDisabled:", 0);
    goto LABEL_10;
  }
  objc_msgSend(v10, "editRecurrenceItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v9, "isEqual:", v26);

  if ((v27 & 1) != 0)
    goto LABEL_9;
LABEL_10:
  objc_opt_class();
  v16 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (v18)
  {
    objc_msgSend(v10, "removeRuleItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v9, "isEqual:", v19);

    if (v20)
      objc_msgSend(v18, "setDestructive:", 1);
  }
  objc_opt_class();
  v21 = v16;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  if (v23)
  {
    objc_msgSend(v10, "allDayItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v9, "isEqual:", v24);

    if (v25)
      objc_msgSend(v23, "setDelegate:", self);
  }

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
  void *v12;
  void *v13;
  HUScheduleDateEditorViewController *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  int v37;
  HUScheduleRuleEditorItemModuleController *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138412802;
    v38 = self;
    v39 = 2112;
    v40 = v7;
    v41 = 2112;
    v42 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User selected item [%@]", (uint8_t *)&v37, 0x20u);

  }
  -[HUScheduleRuleEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "editStartDatePeriodItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqual:", v9);

  if (v10)
  {
    objc_msgSend(v8, "editedScheduleRule");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "yearDayRule");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "validFrom");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[HUScheduleDateEditorViewController initWithDate:editorContext:delegate:]([HUScheduleDateEditorViewController alloc], "initWithDate:editorContext:delegate:", v13, 0, self);
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "editedScheduleRule");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138413058;
      v38 = self;
      v39 = 2112;
      v40 = v16;
      v41 = 2112;
      v42 = v13;
      v43 = 2112;
      v44 = v17;
      v18 = "%@:%@ Preparing to show schedule rule date editor with initial start date [%@] from schedule rule [%@].";
LABEL_12:
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v37, 0x2Au);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  objc_msgSend(v8, "editEndDatePeriodItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "isEqual:", v19);

  if (v20)
  {
    objc_msgSend(v8, "editedScheduleRule");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "yearDayRule");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "validUntil");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[HUScheduleDateEditorViewController initWithDate:editorContext:delegate:]([HUScheduleDateEditorViewController alloc], "initWithDate:editorContext:delegate:", v13, 1, self);
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "editedScheduleRule");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138413058;
      v38 = self;
      v39 = 2112;
      v40 = v16;
      v41 = 2112;
      v42 = v13;
      v43 = 2112;
      v44 = v17;
      v18 = "%@:%@ Preparing to show schedule rule date editor with initial end date [%@] from schedule rule [%@].";
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v8, "editRecurrenceItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v5, "isEqual:", v23);

  if (v24)
  {
    objc_msgSend(v8, "editedScheduleRule");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "weekDayRule");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "daysOfTheWeek");

    HMDaysOfTheWeekToDateComponents();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HUScheduleRecurrenceEditorViewController initWithRecurrences:delegate:]([HUScheduleRecurrenceEditorViewController alloc], "initWithRecurrences:delegate:", v13, self);
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "editedScheduleRule");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138413058;
      v38 = self;
      v39 = 2112;
      v40 = v16;
      v41 = 2112;
      v42 = v13;
      v43 = 2112;
      v44 = v17;
      v18 = "%@:%@ Preparing to show schedule rule recurrence editor with initial recurrences [%@] from schedule rule [%@].";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_msgSend(v8, "removeRuleItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v5, "isEqual:", v32);

  if (v33)
  {
    HFLogForCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "existingScheduleRule");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138412802;
      v38 = self;
      v39 = 2112;
      v40 = v35;
      v41 = 2112;
      v42 = v36;
      _os_log_impl(&dword_1B8E1E000, v34, OS_LOG_TYPE_DEFAULT, "%@:%@ Preparing to remove schedule rule [%@].", (uint8_t *)&v37, 0x20u);

    }
    -[HUScheduleRuleEditorItemModuleController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "existingScheduleRule");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scheduleRuleEditorModuleController:didRequestRuleRemoval:", self, v15);
    v14 = 0;
    goto LABEL_13;
  }
  v14 = 0;
LABEL_14:
  objc_opt_class();
  -[HUItemModuleController host](self, "host");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v28 = v27;
  else
    v28 = 0;
  v29 = v28;

  if (v29 && v14)
  {
    objc_msgSend(v29, "navigationController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "pushViewController:animated:", v14, 1);

  }
  return 0;
}

- (void)didUpdateRecurrences:(id)a3 recurrences:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  HUScheduleRuleEditorItemModuleController *v11;
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
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Did update recurrences to [%@].", (uint8_t *)&v10, 0x20u);

  }
  -[HUScheduleRuleEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "scheduleType") == 2
    && -[HUScheduleRuleEditorItemModuleController _validateRecurrences:](self, "_validateRecurrences:", v6))
  {
    objc_msgSend(v9, "updateScheduleRuleRecurrences:", v6);
  }

}

- (void)didUpdateDate:(id)a3 date:(id)a4 editorContext:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  HUScheduleRuleEditorItemModuleController *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Did update date to [%@].", (uint8_t *)&v17, 0x20u);

  }
  -[HUScheduleRuleEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "scheduleType") == 1)
  {
    if (a5 == 1)
    {
      if (-[HUScheduleRuleEditorItemModuleController _validateEndDateAfterNowDate:](self, "_validateEndDateAfterNowDate:", v8))
      {
        objc_msgSend(v11, "editedScheduleRule");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "yearDayRule");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "validFrom");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[HUScheduleRuleEditorItemModuleController _validateEndDateAfterStartDate:startDate:](self, "_validateEndDateAfterStartDate:startDate:", v8, v14))
        {
          objc_msgSend(v11, "updateScheduleRuleEndDate:", v8);
        }
        goto LABEL_11;
      }
    }
    else if (!a5)
    {
      objc_msgSend(v11, "editedScheduleRule");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "yearDayRule");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "validUntil");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[HUScheduleRuleEditorItemModuleController _validateStartDateBeforeEndDate:endDate:](self, "_validateStartDateBeforeEndDate:endDate:", v8, v14))
      {
        objc_msgSend(v11, "updateScheduleRuleStartDate:", v8);
      }
LABEL_11:

    }
  }

}

- (BOOL)_validateRecurrences:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  void *v10;
  int v11;
  HUScheduleRuleEditorItemModuleController *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && !objc_msgSend(v5, "hmf_isEmpty"))
  {
    v8 = 1;
  }
  else
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = self;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "%@:%@ Selected recurrences [%@] are nil/empty. Cannot update schedule rules.", (uint8_t *)&v11, 0x20u);

    }
    -[HUScheduleRuleEditorItemModuleController _presentAlertWithError:](self, "_presentAlertWithError:", 98);
    v8 = 0;
  }

  return v8;
}

- (BOOL)_validateStartDateBeforeEndDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  void *v12;
  int v14;
  HUScheduleRuleEditorItemModuleController *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "compare:", v8);
  if ((v9 & 0x8000000000000000) == 0)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138413058;
      v15 = self;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "%@:%@ Invalid schedule rule. Start date [%@] is not before end date [%@].", (uint8_t *)&v14, 0x2Au);

    }
    -[HUScheduleRuleEditorItemModuleController _presentAlertWithError:](self, "_presentAlertWithError:", 99);
  }

  return v9 >> 63;
}

- (BOOL)_validateEndDateAfterStartDate:(id)a3 startDate:(id)a4
{
  id v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  void *v12;
  int v14;
  HUScheduleRuleEditorItemModuleController *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "compare:", v7);
  if ((v9 & 0x8000000000000000) == 0)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138413058;
      v15 = self;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "%@:%@ Invalid schedule rule. End date [%@] is not after start date [%@].", (uint8_t *)&v14, 0x2Au);

    }
    -[HUScheduleRuleEditorItemModuleController _presentAlertWithError:](self, "_presentAlertWithError:", 100);
  }

  return v9 >> 63;
}

- (BOOL)_validateEndDateAfterNowDate:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v10;
  int v12;
  HUScheduleRuleEditorItemModuleController *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "compare:", v5);
  if ((v7 & 0x8000000000000000) == 0)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413058;
      v13 = self;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "%@:%@ Invalid schedule rule. End date [%@] is not after current date [%@].", (uint8_t *)&v12, 0x2Au);

    }
    -[HUScheduleRuleEditorItemModuleController _presentAlertWithError:](self, "_presentAlertWithError:", 101);
  }

  return v7 >> 63;
}

- (void)_presentAlertWithError:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleError:operationType:options:retryBlock:cancelBlock:", v4, *MEMORY[0x1E0D30A08], 0, 0, 0);

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

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  int v8;
  HUScheduleRuleEditorItemModuleController *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 1024;
    v11 = v4;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: User tapped switchCell to: %{BOOL}d", (uint8_t *)&v8, 0x12u);
  }

  -[HUScheduleRuleEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateAllDayToggle:", v4);

}

- (void)timePickerCell:(id)a3 didSelectStartTime:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  HUScheduleRuleEditorItemModuleController *v11;
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
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Start time changed to to [%@].", (uint8_t *)&v10, 0x20u);

  }
  -[HUScheduleRuleEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateScheduleRuleStartTime:", v6);

}

- (void)timePickerCell:(id)a3 didSelectEndTime:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  HUScheduleRuleEditorItemModuleController *v11;
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
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ End time changed to to [%@].", (uint8_t *)&v10, 0x20u);

  }
  -[HUScheduleRuleEditorItemModuleController _editorItemModule](self, "_editorItemModule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateScheduleRuleEndTime:", v6);

}

- (HUScheduleRuleEditorItemModuleControllerDelegate)delegate
{
  return (HUScheduleRuleEditorItemModuleControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
