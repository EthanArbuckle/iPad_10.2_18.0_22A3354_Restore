@implementation HUScheduleRuleEditorViewController

- (HUScheduleRuleEditorViewController)initWithScheduleType:(unint64_t)a3 scheduleRule:(id)a4 scheduleBuilder:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  HUScheduleRuleEditorViewController *v17;
  HUScheduleRuleEditorViewController *v18;
  __CFString *v19;
  void *v20;
  void *v22;
  objc_super v23;
  _QWORD v24[4];
  id v25;
  id v26;
  unint64_t v27;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUScheduleRuleEditorViewController.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scheduleBuilder"));

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:", self);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __97__HUScheduleRuleEditorViewController_initWithScheduleType_scheduleRule_scheduleBuilder_delegate___block_invoke;
  v24[3] = &unk_1E6F53630;
  v27 = a3;
  v15 = v11;
  v25 = v15;
  v16 = v12;
  v26 = v16;
  objc_msgSend(v14, "setItemModuleCreator:", v24);
  v23.receiver = self;
  v23.super_class = (Class)HUScheduleRuleEditorViewController;
  v17 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v23, sel_initWithItemManager_tableViewStyle_, v14, 1);
  v18 = v17;
  if (v17)
    objc_storeWeak((id *)&v17->_delegate, v13);
  -[HUScheduleRuleEditorViewController setIsModalPresentation:](v18, "setIsModalPresentation:", v15 == 0);
  if (a3 == 2)
    v19 = CFSTR("HUScheduleRuleEditor_Times_Title");
  else
    v19 = CFSTR("HUScheduleRuleEditor_Dates_Title");
  _HULocalizedStringWithDefaultValue(v19, v19, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleRuleEditorViewController setTitleString:](v18, "setTitleString:", v20);

  return v18;
}

id __97__HUScheduleRuleEditorViewController_initWithScheduleType_scheduleRule_scheduleBuilder_delegate___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  HUScheduleRuleEditorItemModule *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HUScheduleRuleEditorItemModule initWithItemUpdater:scheduleType:scheduleRule:scheduleBuilder:]([HUScheduleRuleEditorItemModule alloc], "initWithItemUpdater:scheduleType:scheduleRule:scheduleBuilder:", v4, a1[6], a1[4], a1[5]);

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
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUScheduleRuleEditorViewController;
  -[HUItemTableViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[HUScheduleRuleEditorViewController titleString](self, "titleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleRuleEditorViewController setTitle:](self, "setTitle:", v3);

  _HULocalizedStringWithDefaultValue(CFSTR("HUBackTitle"), CFSTR("HUBackTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUScheduleRuleEditorViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackButtonTitle:", v4);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonPressed_);
  -[HUScheduleRuleEditorViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUScheduleRuleEditorItemModuleController *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Unexpected module %@"), v4);
  v5 = -[HUItemModuleController initWithModule:]([HUScheduleRuleEditorItemModuleController alloc], "initWithModule:", v4);
  -[HUScheduleRuleEditorItemModuleController setDelegate:](v5, "setDelegate:", self);

  return v5;
}

- (void)doneButtonPressed:(id)a3
{
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  HUScheduleRuleEditorViewController *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Done button pressed", (uint8_t *)&v11, 0x16u);

  }
  -[HUScheduleRuleEditorViewController _saveChanges](self, "_saveChanges");
  v7 = -[HUScheduleRuleEditorViewController isModalPresentation](self, "isModalPresentation");
  -[HUScheduleRuleEditorViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);
  else
    v10 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

}

- (void)scheduleRuleEditorModuleController:(id)a3 didRequestRuleRemoval:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  HUScheduleRuleEditorViewController *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412802;
    v25 = self;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ User requested to remove schedule rule [%@]", (uint8_t *)&v24, 0x20u);

  }
  -[HUScheduleRuleEditorViewController _editorItemModule](self, "_editorItemModule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "existingScheduleRule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412802;
      v25 = self;
      v26 = 2112;
      v27 = v13;
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Removing schedule rule [%@]", (uint8_t *)&v24, 0x20u);

    }
    objc_msgSend(v9, "scheduleBuilder");
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C99E20];
    -[NSObject rules](v12, "rules");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "removeObject:", v10);
    -[NSObject setRules:](v12, "setRules:", v16);
    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUScheduleRuleEditorViewController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138413058;
      v25 = self;
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Notifying delegate [%@] of updated schedule builder [%@]", (uint8_t *)&v24, 0x2Au);

    }
    -[HUScheduleRuleEditorViewController delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "didUpdateScheduleBuilder:scheduleBuilder:", self, v12);

    -[HUScheduleRuleEditorViewController navigationController](self, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "popViewControllerAnimated:", 1);

  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = self;
    v26 = 2112;
    v27 = v23;
    _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "%@:%@ Invalid request. Requesting to remove schedule rule with no existing rule.", (uint8_t *)&v24, 0x16u);

  }
}

- (void)_saveChanges
{
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
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  const char *aSelector;
  uint8_t buf[4];
  HUScheduleRuleEditorViewController *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[HUScheduleRuleEditorViewController _editorItemModule](self, "_editorItemModule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "existingScheduleRule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editedScheduleRule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v6, "isWeekDayRule"))
    {
      objc_msgSend(v4, "editedStartTime");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v4, "editedStartTime");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v7, "weekDayRule");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "startTime");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v4, "editedEndTime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v4, "editedEndTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v7, "weekDayRule");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "endTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (!-[HUScheduleRuleEditorViewController _validateStartTimeBeforeEndTime:endTime:](self, "_validateStartTimeBeforeEndTime:endTime:", v9, v13))
      {

        v10 = v7;
LABEL_28:

        goto LABEL_29;
      }
      aSelector = a2;
      v15 = objc_alloc(MEMORY[0x1E0CBA960]);
      objc_msgSend(v7, "weekDayRule");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithStartTime:endTime:daysOfTheWeek:", v9, v13, objc_msgSend(v16, "daysOfTheWeek"));

      HFLogForCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(aSelector);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v38 = self;
        v39 = 2112;
        v40 = v19;
        v41 = 2112;
        v42 = v17;
        _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ New weekDay schedule rule will be %@", buf, 0x20u);

      }
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31730]), "initWithWeekDayRule:", v17);
      HFLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(aSelector);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v38 = self;
        v39 = 2112;
        v40 = v21;
        v41 = 2112;
        v42 = v7;
        v43 = 2112;
        v44 = v10;
        _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating from schedule rule %@ to %@", buf, 0x2Au);

      }
      a2 = aSelector;
    }
    else
    {
      v10 = v7;
    }
    objc_msgSend(v4, "scheduleBuilder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v5 && v10)
    {
      if (v24)
      {
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v38 = self;
        v39 = 2112;
        v40 = v25;
        v41 = 2112;
        v42 = v5;
        v43 = 2112;
        v44 = v10;
        _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ Replacing existing schedule rule [%@] with edited schedule rule [%@]", buf, 0x2Au);

      }
      v26 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v22, "rules");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setWithSet:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "removeObject:", v5);
    }
    else
    {
      if (v24)
      {
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v38 = self;
        v39 = 2112;
        v40 = v29;
        v41 = 2112;
        v42 = v10;
        _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ Adding schedule rule [%@]", buf, 0x20u);

      }
      v30 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v22, "rules");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setWithSet:", v31);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v28, "addObject:", v10);
    objc_msgSend(v22, "setRules:", v28);

    HFLogForCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUScheduleRuleEditorViewController delegate](self, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v38 = self;
      v39 = 2112;
      v40 = v33;
      v41 = 2112;
      v42 = v34;
      v43 = 2112;
      v44 = v22;
      _os_log_impl(&dword_1B8E1E000, v32, OS_LOG_TYPE_DEFAULT, "%@:%@ Notifying delegate [%@] of updated schedule builder [%@]", buf, 0x2Au);

    }
    -[HUScheduleRuleEditorViewController delegate](self, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "didUpdateScheduleBuilder:scheduleBuilder:", self, v22);

    goto LABEL_28;
  }
LABEL_29:

}

- (BOOL)_validateStartTimeBeforeEndTime:(id)a3 endTime:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v15;
  int v17;
  HUScheduleRuleEditorViewController *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateFromComponents:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateFromComponents:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "compare:", v11);

  if ((v12 & 0x8000000000000000) == 0)
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138413058;
      v18 = self;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v8;
      _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "%@:%@ Invalid schedule rule. Start time [%@] is not before end time [%@].", (uint8_t *)&v17, 0x2Au);

    }
    -[HUScheduleRuleEditorViewController _presentAlertWithError:](self, "_presentAlertWithError:", 102);
  }

  return v12 >> 63;
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
  void *v2;
  void *v3;
  void *v4;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemModules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_97);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __55__HUScheduleRuleEditorViewController__editorItemModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HUScheduleRuleEditorViewControllerDelegate)delegate
{
  return (HUScheduleRuleEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIBarButtonItem)savedButtonBarItem
{
  return self->_savedButtonBarItem;
}

- (void)setSavedButtonBarItem:(id)a3
{
  objc_storeStrong((id *)&self->_savedButtonBarItem, a3);
}

- (BOOL)isModalPresentation
{
  return self->_isModalPresentation;
}

- (void)setIsModalPresentation:(BOOL)a3
{
  self->_isModalPresentation = a3;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  objc_storeStrong((id *)&self->_titleString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_savedButtonBarItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
