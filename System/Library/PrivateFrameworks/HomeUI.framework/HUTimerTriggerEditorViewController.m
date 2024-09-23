@implementation HUTimerTriggerEditorViewController

- (HUTimerTriggerEditorViewController)initWithTimerTriggerBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  id v9;
  HUTimerTriggerEditorItemManager *v10;
  HUTimerTriggerEditorViewController *v11;
  HUTriggerConditionEditorItemModuleController *v12;
  void *v13;
  uint64_t v14;
  HUTriggerConditionEditorItemModuleController *conditionModuleController;
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
  int v27;
  char **v28;
  char *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  id v49;
  objc_super v50;

  v8 = a3;
  v9 = a5;
  v10 = -[HUTimerTriggerEditorItemManager initWithTimerTriggerBuilder:delegate:]([HUTimerTriggerEditorItemManager alloc], "initWithTimerTriggerBuilder:delegate:", v8, self);
  v50.receiver = self;
  v50.super_class = (Class)HUTimerTriggerEditorViewController;
  v11 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v50, sel_initWithItemManager_tableViewStyle_, v10, 1);
  if (v11)
  {
    v12 = [HUTriggerConditionEditorItemModuleController alloc];
    -[HUTimerTriggerEditorItemManager conditionModule](v10, "conditionModule");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HUTriggerConditionEditorItemModuleController initWithModule:delegate:](v12, "initWithModule:delegate:", v13, v11);
    conditionModuleController = v11->_conditionModuleController;
    v11->_conditionModuleController = (HUTriggerConditionEditorItemModuleController *)v14;

    -[HUTimerTriggerEditorViewController setTimerTriggerBuilder:](v11, "setTimerTriggerBuilder:", v8);
    -[HUTimerTriggerEditorViewController setMode:](v11, "setMode:", a4);
    -[HUTimerTriggerEditorViewController setDelegate:](v11, "setDelegate:", v9);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4
      || (objc_msgSend(v8, "recurrences"), v17 = (void *)objc_claimAutoreleasedReturnValue(), v17, !v17))
    {
      objc_msgSend(MEMORY[0x1E0C99D78], "hf_dailyWeekdayIntervalComponentsWithCalendar:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTimerTriggerEditorViewController setSelectedRecurrences:](v11, "setSelectedRecurrences:", v18);

    }
    _HULocalizedStringWithDefaultValue(CFSTR("HUTimerTriggerEditorTitle"), CFSTR("HUTimerTriggerEditorTitle"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerTriggerEditorViewController setTitle:](v11, "setTitle:", v19);

    _HULocalizedStringWithDefaultValue(CFSTR("HUBackButtonTitle"), CFSTR("HUBackButtonTitle"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerTriggerEditorViewController navigationItem](v11, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackButtonTitle:", v20);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dateByAddingUnit:value:toDate:options:", 32, 1, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "components:fromDate:", 96, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController itemManager](v11, "itemManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDefaultFireTimeComponents:", v24);

    if (!a4)
    {
      objc_msgSend(v8, "triggerActionSets");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "hasActions");
      v28 = &selRef__showSummary_;
      if (!v27)
        v28 = &selRef__showActionEditor_;
      v29 = *v28;

      v30 = objc_alloc(MEMORY[0x1E0CEA380]);
      _HULocalizedStringWithDefaultValue(CFSTR("HUTimerTriggerEditorNextButton"), CFSTR("HUTimerTriggerEditorNextButton"), 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithTitle:style:target:action:", v31, 2, v11, v29);
      -[HUTimerTriggerEditorViewController navigationItem](v11, "navigationItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setRightBarButtonItem:", v32);

    }
    -[HUTimerTriggerEditorItemManager timeOptionItem](v10, "timeOptionItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerTriggerEditorViewController timerTriggerBuilder](v11, "timerTriggerBuilder");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "eventBuilder");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = v36;
      objc_msgSend(v37, "fireTimeComponents");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        v49 = v9;
        objc_msgSend(v37, "fireTimeComponents");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUItemTableViewController itemManager](v11, "itemManager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setDefaultFireTimeComponents:", v39);
LABEL_24:

        v9 = v49;
        goto LABEL_25;
      }
      objc_msgSend(v37, "fireDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
      {
LABEL_25:

        goto LABEL_26;
      }
      v49 = v9;
      objc_msgSend(v37, "fireDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "components:fromDate:", 96, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController itemManager](v11, "itemManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setDefaultFireTimeComponents:", v40);
LABEL_23:

      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_26:
      -[HUTimerTriggerEditorViewController setSelectedDateOptionItem:](v11, "setSelectedDateOptionItem:", v34);

      goto LABEL_27;
    }
    v41 = v36;
    objc_msgSend(v41, "significantEvent");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v9;
    if (objc_msgSend(v39, "isEqualToString:", *MEMORY[0x1E0CB9B88]))
    {
      -[HUTimerTriggerEditorItemManager sunriseOptionItem](v10, "sunriseOptionItem");
      v42 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v39, "isEqualToString:", *MEMORY[0x1E0CB9B90]))
        goto LABEL_20;
      -[HUTimerTriggerEditorItemManager sunsetOptionItem](v10, "sunsetOptionItem");
      v42 = objc_claimAutoreleasedReturnValue();
    }
    v45 = (void *)v42;

    v34 = v45;
LABEL_20:
    -[HUItemTableViewController itemManager](v11, "itemManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "significantEventOffset");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v40, "setDefaultOffset:forSignificantEvent:", v44, v39);
    }
    else
    {
      v48 = v23;
      v46 = (void *)objc_opt_new();
      objc_msgSend(v40, "setDefaultOffset:forSignificantEvent:", v46, v39);

      v23 = v48;
    }
    goto LABEL_23;
  }
LABEL_27:

  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUTimerTriggerEditorViewController;
  -[HUItemTableViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
  {
    -[HUTimerTriggerEditorViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    +[HUGridLimitedWidthViewLayoutOptions defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:](HUGridLimitedWidthViewLayoutOptions, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", 1, &unk_1E7040B58, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerTriggerEditorViewController setLayoutOptions:](self, "setLayoutOptions:", v7);

  }
}

- (void)setSelectedDateOptionItem:(id)a3
{
  HFItem **p_selectedDateOptionItem;
  HFItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HFItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HFItem *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  HFItem *v25;
  void *v26;
  void *v27;
  HFItem *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  HFItem *v35;
  void *v36;
  HFItem *v37;
  void *v38;
  id v39;

  p_selectedDateOptionItem = &self->_selectedDateOptionItem;
  v39 = a3;
  if ((objc_msgSend(v39, "isEqual:", *p_selectedDateOptionItem) & 1) == 0)
  {
    v6 = *p_selectedDateOptionItem;
    objc_storeStrong((id *)&self->_selectedDateOptionItem, a3);
    if (v6)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "indexPathForItem:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[HUTimerTriggerEditorViewController tableView](self, "tableView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cellForRowAtIndexPath:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUTimerTriggerEditorViewController updateCell:forItem:indexPath:animated:](self, "updateCell:forItem:indexPath:animated:", v10, v6, v8, 1);
      }
      -[HUItemTableViewController itemManager](self, "itemManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeOptionItem");
      v12 = (HFItem *)objc_claimAutoreleasedReturnValue();

      if (v6 == v12)
      {
        -[HUItemTableViewController itemManager](self, "itemManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setDatePickerShown:", 0);

      }
    }
    if (!*p_selectedDateOptionItem)
    {
      -[HUTimerTriggerEditorViewController timerTriggerBuilder](self, "timerTriggerBuilder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setEventBuilder:", 0);
LABEL_21:

      goto LABEL_22;
    }
    -[HUItemTableViewController itemManager](self, "itemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "indexPathForItem:", *p_selectedDateOptionItem);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HUTimerTriggerEditorViewController tableView](self, "tableView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cellForRowAtIndexPath:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUTimerTriggerEditorViewController updateCell:forItem:indexPath:animated:](self, "updateCell:forItem:indexPath:animated:", v17, *p_selectedDateOptionItem, v15, 1);
    }
    v18 = *p_selectedDateOptionItem;
    -[HUItemTableViewController itemManager](self, "itemManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeOptionItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = -[HFItem isEqual:](v18, "isEqual:", v20);

    if ((_DWORD)v18)
    {
      v21 = objc_alloc_init(MEMORY[0x1E0D311D0]);
      -[HUItemTableViewController itemManager](self, "itemManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "defaultFireTimeComponents");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFireTimeComponents:", v23);

      -[HUTimerTriggerEditorViewController timerTriggerBuilder](self, "timerTriggerBuilder");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setEventBuilder:", v21);

    }
    else
    {
      v25 = *p_selectedDateOptionItem;
      -[HUItemTableViewController itemManager](self, "itemManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sunriseOptionItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HFItem isEqual:](v25, "isEqual:", v27))
      {

      }
      else
      {
        v28 = *p_selectedDateOptionItem;
        -[HUItemTableViewController itemManager](self, "itemManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sunsetOptionItem");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v28) = -[HFItem isEqual:](v28, "isEqual:", v30);

        if (!(_DWORD)v28)
        {
          NSLog(CFSTR("Unhandled option item: %@"), *p_selectedDateOptionItem);
LABEL_19:
          v35 = *p_selectedDateOptionItem;
          -[HUItemTableViewController itemManager](self, "itemManager");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "timeOptionItem");
          v37 = (HFItem *)objc_claimAutoreleasedReturnValue();

          if (v35 == v37)
          {
            -[HUItemTableViewController itemManager](self, "itemManager");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setDatePickerShown:", 1);

          }
          goto LABEL_21;
        }
      }
      -[HUTimerTriggerEditorViewController _selectedSignificantEvent](self, "_selectedSignificantEvent");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController itemManager](self, "itemManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "defaultOffsetForSignificantEvent:", v21);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = objc_alloc_init(MEMORY[0x1E0D317F8]);
      objc_msgSend(v33, "setSignificantEvent:", v21);
      objc_msgSend(v33, "setSignificantEventOffset:", v32);
      -[HUTimerTriggerEditorViewController timerTriggerBuilder](self, "timerTriggerBuilder");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setEventBuilder:", v33);

    }
    goto LABEL_19;
  }
LABEL_22:

}

- (NSDateComponents)selectedSignificantEventOffset
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_opt_class();
  -[HUTimerTriggerEditorViewController timerTriggerBuilder](self, "timerTriggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "significantEventOffset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  return (NSDateComponents *)v9;
}

- (void)setSelectedSignificantEventOffset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  -[HUTimerTriggerEditorViewController timerTriggerBuilder](self, "timerTriggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "setSignificantEventOffset:", v9);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateForSignificantEventOffsetChange");

  }
}

- (NSDateComponents)selectedFireTimeComponents
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_opt_class();
  -[HUTimerTriggerEditorViewController timerTriggerBuilder](self, "timerTriggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "fireTimeComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v7;
}

- (void)setSelectedFireTimeComponents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  -[HUTimerTriggerEditorViewController timerTriggerBuilder](self, "timerTriggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    objc_msgSend(v7, "setFireTimeComponents:", v8);

}

- (NSArray)selectedRecurrences
{
  void *v2;
  void *v3;

  -[HUTimerTriggerEditorViewController timerTriggerBuilder](self, "timerTriggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setSelectedRecurrences:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUTimerTriggerEditorViewController timerTriggerBuilder](self, "timerTriggerBuilder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecurrences:", v4);

}

- (void)setLayoutOptions:(id)a3
{
  void *v5;
  char v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v16 = a3;
  if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
  {
    -[HUTimerTriggerEditorViewController layoutOptions](self, "layoutOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v16, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_layoutOptions, a3);
      objc_msgSend(v16, "sectionTopMargin");
      v8 = v7;
      objc_msgSend(v16, "sectionLeadingMargin");
      v10 = v9;
      objc_msgSend(v16, "sectionBottomMargin");
      v12 = v11;
      objc_msgSend(v16, "sectionTrailingMargin");
      v14 = v13;
      -[HUTimerTriggerEditorViewController tableView](self, "tableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_setSectionContentInset:", v8, v10, v12, v14);

    }
  }

}

- (void)_showActionEditor:(id)a3
{
  HUTriggerActionPickerViewController *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  HUTriggerActionPickerViewController *v10;

  if (-[HUTimerTriggerEditorViewController _canContinue](self, "_canContinue", a3))
  {
    v4 = [HUTriggerActionPickerViewController alloc];
    -[HUTimerTriggerEditorViewController timerTriggerBuilder](self, "timerTriggerBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HUTimerTriggerEditorViewController mode](self, "mode");
    -[HUTimerTriggerEditorViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HUTriggerActionPickerViewController initWithTriggerBuilder:mode:delegate:](v4, "initWithTriggerBuilder:mode:delegate:", v5, v6, v7);

    -[HUTimerTriggerEditorViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);

  }
}

- (void)_showSummary:(id)a3
{
  HUTriggerSummaryViewController *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  HUTriggerSummaryViewController *v10;

  if (-[HUTimerTriggerEditorViewController _canContinue](self, "_canContinue", a3))
  {
    v4 = [HUTriggerSummaryViewController alloc];
    -[HUTimerTriggerEditorViewController timerTriggerBuilder](self, "timerTriggerBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HUTimerTriggerEditorViewController mode](self, "mode");
    -[HUTimerTriggerEditorViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HUTriggerSummaryViewController initWithTriggerBuilder:mode:isPresentedModally:delegate:](v4, "initWithTriggerBuilder:mode:isPresentedModally:delegate:", v5, v6, 0, v7);

    -[HUTimerTriggerEditorViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);

  }
}

- (void)_cancel:(id)a3
{
  id v4;

  -[HUTimerTriggerEditorViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerEditor:didFinishWithTriggerBuilder:", self, 0);

}

- (void)_changeFireTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v10;
    objc_msgSend(v4, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "components:fromDate:", 96, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerTriggerEditorViewController setSelectedFireTimeComponents:](self, "setSelectedFireTimeComponents:", v7);

    -[HUTimerTriggerEditorViewController selectedFireTimeComponents](self, "selectedFireTimeComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDefaultFireTimeComponents:", v8);

  }
}

- (void)datePickerCell:(id)a3 didSelectDate:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = a4;
  objc_msgSend(v5, "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 96, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTimerTriggerEditorViewController setSelectedFireTimeComponents:](self, "setSelectedFireTimeComponents:", v8);
  -[HUTimerTriggerEditorViewController selectedFireTimeComponents](self, "selectedFireTimeComponents");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDefaultFireTimeComponents:", v10);

}

- (id)itemModuleControllers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUTimerTriggerEditorViewController conditionModuleController](self, "conditionModuleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  objc_class *v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateOptionsItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if ((v8 & 1) != 0)
    goto LABEL_6;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "datePickerItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v5
    || (-[HUItemTableViewController itemManager](self, "itemManager"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "recurrencesItem"),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        v12 == v5))
  {
LABEL_6:
    v13 = (void *)objc_opt_class();
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v8 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    objc_msgSend(v10, "setDelegate:", self);
    objc_msgSend(v10, "setHideTitleLabel:", 1);
    +[HUIconCellContentMetrics defaultMetrics](HUIconCellContentMetrics, "defaultMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "iconSize");
    objc_msgSend(v10, "setLeftMargin:");
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[HUListContentConfigurationUtilities instructionsConfigurationForItem:](HUListContentConfigurationUtilities, "instructionsConfigurationForItem:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentConfiguration:", v10);
    objc_msgSend(MEMORY[0x1E0CEA370], "clearConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundConfiguration:", v11);
LABEL_8:

  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  unsigned int v41;
  objc_super v42;
  _QWORD v43[3];

  v6 = a6;
  v43[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateOptionsItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v11);

  if (v15)
  {
    v16 = objc_opt_class();
    v17 = v10;
    if (v17)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v17;
      if (v18)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v21 = v12;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v16, objc_opt_class());

      v12 = v21;
    }
    v19 = 0;
LABEL_9:

    objc_msgSend(v11, "latestResults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitleText:", v24);

    -[HUTimerTriggerEditorViewController selectedDateOptionItem](self, "selectedDateOptionItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = objc_msgSend(v11, "isEqual:", v25);

    if ((_DWORD)v24)
    {
      v40 = v12;
      v41 = v6;
      objc_msgSend(v19, "setChecked:", 1);
      -[HUItemTableViewController itemManager](self, "itemManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sunriseOptionItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v27;
      -[HUItemTableViewController itemManager](self, "itemManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sunsetOptionItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "containsObject:", v11);

      if (v31)
        v32 = 4;
      else
        v32 = 0;
      objc_msgSend(v19, "setAccessoryType:", v32);
      v6 = v41;
      v12 = v40;
    }
    else
    {
      objc_msgSend(v19, "setChecked:", 0);
      objc_msgSend(v19, "setAccessoryType:", 0);
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = v10;
    objc_msgSend(v33, "setDelegate:", self);
    v34 = (void *)MEMORY[0x1E0C99E60];
    -[HUTimerTriggerEditorViewController selectedRecurrences](self, "selectedRecurrences");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setWithArray:", v19);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSelectedRecurrences:", v35);

LABEL_22:
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v36 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = v36;
    else
      v37 = 0;
    v38 = v37;

    -[HUTimerTriggerEditorViewController selectedFireTimeComponents](self, "selectedFireTimeComponents");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTimeComponents:", v39);

  }
LABEL_23:
  v42.receiver = self;
  v42.super_class = (Class)HUTimerTriggerEditorViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v42, sel_updateCell_forItem_indexPath_animated_, v10, v11, v12, v6);

}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[HUTimerTriggerEditorViewController _instructionsSectionIDs](self, "_instructionsSectionIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedSectionIdentifierForSectionIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "containsObject:", v7);

  return v8;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[HUTimerTriggerEditorViewController _instructionsSectionIDs](self, "_instructionsSectionIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedSectionIdentifierForSectionIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "containsObject:", v7);

  return v8;
}

- (id)_instructionsSectionIDs
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("HUTimerTriggerEditorSectionIdentifierInstructions");
  v3[1] = CFSTR("HUTimerTriggerEditorSectionIdentifierRepeatInstructions");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)HUTimerTriggerEditorViewController;
    v11 = -[HUItemTableViewController tableView:shouldHighlightRowAtIndexPath:](&v15, sel_tableView_shouldHighlightRowAtIndexPath_, v6, v7);
  }
  else
  {
    -[HUItemTableViewController itemManager](self, "itemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateOptionsItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "containsObject:", v9);

  }
  return v11;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  HUTimeEventOffsetEditorViewController *v5;
  void *v6;
  void *v7;
  HUTimeEventOffsetEditorViewController *v8;
  void *v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUTimerTriggerEditorViewController;
  -[HUItemTableViewController tableView:accessoryButtonTappedForRowWithIndexPath:](&v11, sel_tableView_accessoryButtonTappedForRowWithIndexPath_, a3, a4);
  v5 = [HUTimeEventOffsetEditorViewController alloc];
  -[HUTimerTriggerEditorViewController _selectedSignificantEvent](self, "_selectedSignificantEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorViewController selectedSignificantEventOffset](self, "selectedSignificantEventOffset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HUTimeEventOffsetEditorViewController initWithSignificantEvent:currentOffset:delegate:](v5, "initWithSignificantEvent:currentOffset:delegate:", v6, v7, self);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v8);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  v10 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v9, 1);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUTimerTriggerEditorViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v14, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController moduleControllerForItem:](self, "moduleControllerForItem:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateOptionsItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v9);

    if (v13)
      -[HUTimerTriggerEditorViewController setSelectedDateOptionItem:](self, "setSelectedDateOptionItem:", v9);
  }

}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v9;

  -[HUItemTableViewController itemManager](self, "itemManager", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedSectionIdentifierForSectionIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("HUTimerTriggerEditorSectionIdentifierRepeat"));

  if (v8)
  {
    -[HUTimerTriggerEditorViewController _localizedRecurrenceDescription](self, "_localizedRecurrenceDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)dayOfWeekPickerCell:(id)a3 didChangeSelectedRecurrences:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "allObjects", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorViewController setSelectedRecurrences:](self, "setSelectedRecurrences:", v5);

  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUTimerTriggerEditorSectionIdentifierRepeat"));

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__HUTimerTriggerEditorViewController_dayOfWeekPickerCell_didChangeSelectedRecurrences___block_invoke;
  v12[3] = &unk_1E6F4CE48;
  v12[4] = self;
  v12[5] = v7;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v12);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemSectionForSectionIndex:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadUIRepresentationForSections:withAnimation:", v11, 0);

}

void __87__HUTimerTriggerEditorViewController_dayOfWeekPickerCell_didChangeSelectedRecurrences___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginUpdates");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footerViewForSection:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_localizedRecurrenceDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  objc_msgSend(v7, "setClipsToBounds:", 1);
  objc_msgSend(v7, "sizeToFit");
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endUpdates");

}

- (void)timerTriggerOffsetEditor:(id)a3 didFinishWithOffset:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorViewController _selectedSignificantEvent](self, "_selectedSignificantEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultOffset:forSignificantEvent:", v5, v7);

  -[HUTimerTriggerEditorViewController setSelectedSignificantEventOffset:](self, "setSelectedSignificantEventOffset:", v5);
  -[HUTimerTriggerEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)timerTriggerOffsetEditorDidCancel:(id)a3
{
  -[HUTimerTriggerEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_localizedRecurrenceDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CBA910];
  -[HUTimerTriggerEditorViewController selectedRecurrences](self, "selectedRecurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_recurrenceNaturalLanguageStringWithRecurrences:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_canContinue
{
  return 1;
}

- (BOOL)_canCommitTriggerBuilder
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;

  -[HUTimerTriggerEditorViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  -[HUTimerTriggerEditorViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerTriggerEditorViewController timerTriggerBuilder](self, "timerTriggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "triggerEditor:shouldCommitTriggerBuilder:", self, v6);

  return v7;
}

- (id)_commitTriggerBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 41);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUTimerTriggerEditorViewController _canCommitTriggerBuilder](self, "_canCommitTriggerBuilder")
    && -[HUTimerTriggerEditorViewController _canContinue](self, "_canContinue"))
  {
    -[HUTimerTriggerEditorViewController timerTriggerBuilder](self, "timerTriggerBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "commitItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (id)objc_msgSend(v7, "addFailureBlock:", &__block_literal_global_80);
    v5 = v7;
  }
  return v5;
}

void __59__HUTimerTriggerEditorViewController__commitTriggerBuilder__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

- (id)_selectedSignificantEvent
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  -[HUTimerTriggerEditorViewController selectedDateOptionItem](self, "selectedDateOptionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sunriseOptionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = (id *)MEMORY[0x1E0CB9B88];
  }
  else
  {
    -[HUTimerTriggerEditorViewController selectedDateOptionItem](self, "selectedDateOptionItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sunsetOptionItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (!v11)
    {
      v12 = 0;
      return v12;
    }
    v7 = (id *)MEMORY[0x1E0CB9B90];
  }
  v12 = *v7;
  return v12;
}

- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4
{
  id v4;

  v4 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", a4, 1);
}

- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4
{
  -[HUTimerTriggerEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (HFTimerTriggerBuilder)timerTriggerBuilder
{
  return self->_timerTriggerBuilder;
}

- (void)setTimerTriggerBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_timerTriggerBuilder, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (HUTriggerEditorDelegate)delegate
{
  return (HUTriggerEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HUTriggerConditionEditorItemModuleController)conditionModuleController
{
  return self->_conditionModuleController;
}

- (HFItem)selectedDateOptionItem
{
  return self->_selectedDateOptionItem;
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_selectedDateOptionItem, 0);
  objc_storeStrong((id *)&self->_conditionModuleController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timerTriggerBuilder, 0);
}

@end
