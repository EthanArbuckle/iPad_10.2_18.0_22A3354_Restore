@implementation HUTimeEventEditorViewController

- (HUTimeEventEditorViewController)initWithTimeEvent:(id)a3 triggerBuilder:(id)a4
{
  id v7;
  id v8;
  HUTimeEventEditorItemManager *v9;
  HUTimeEventEditorViewController *v10;
  HUTimeEventEditorViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v7 = a4;
  v8 = a3;
  v9 = -[HUTimeEventEditorItemManager initWithTimeEvent:triggerBuilder:delegate:]([HUTimeEventEditorItemManager alloc], "initWithTimeEvent:triggerBuilder:delegate:", v8, v7, self);

  v21.receiver = self;
  v21.super_class = (Class)HUTimeEventEditorViewController;
  v10 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v21, sel_initWithItemManager_tableViewStyle_, v9, 1);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_triggerBuilder, a4);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUTimerTriggerEditorTitle"), CFSTR("HUTimerTriggerEditorTitle"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimeEventEditorViewController setTitle:](v11, "setTitle:", v13);

    _HULocalizedStringWithDefaultValue(CFSTR("HUBackButtonTitle"), CFSTR("HUBackButtonTitle"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimeEventEditorViewController navigationItem](v11, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackButtonTitle:", v14);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 32, 1, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "components:fromDate:", 96, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController itemManager](v11, "itemManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDefaultFireTimeComponents:", v18);

  }
  return v11;
}

- (HUTimeEventEditorViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HUTimeEventEditorViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[4];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "eventBuilderItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeEventBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggerBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUTimeEventEditorViewController initWithTimeEvent:triggerBuilder:](self, "initWithTimeEvent:triggerBuilder:", v9, v10);

  if (v11)
  {
    -[HUTimeEventEditorViewController setFlow:](v11, "setFlow:", v6);
    -[HUTimeEventEditorViewController setStepIdentifier:](v11, "setStepIdentifier:", v7);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimeEventEditorViewController flow](v11, "flow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "originalEventBuilderItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      v21[3] = 1;
      v15 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(v12, "weekdaySymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __63__HUTimeEventEditorViewController_initWithFlow_stepIdentifier___block_invoke;
      v20[3] = &unk_1E6F4C1E0;
      v20[4] = v21;
      objc_msgSend(v15, "na_arrayByRepeatingWithCount:generatorBlock:", v17, v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTimeEventEditorViewController setSelectedRecurrences:](v11, "setSelectedRecurrences:", v18);

      _Block_object_dispose(v21, 8);
    }

  }
  return v11;
}

id __63__HUTimeEventEditorViewController_initWithFlow_stepIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v2, "setWeekday:", (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))++);
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)HUTimeEventEditorViewController;
  -[HUItemTableViewController viewDidLoad](&v31, sel_viewDidLoad);
  -[HUTimeEventEditorViewController flow](self, "flow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorViewController stepIdentifier](self, "stepIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "shouldShowDoneButtonForStep:", v4);

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CEA380]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = sel__doneButtonPressed_;
  }
  else
  {
    -[HUTimeEventEditorViewController flow](self, "flow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimeEventEditorViewController stepIdentifier](self, "stepIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "shouldShowNextButtonForStep:", v10);

    if (!v11)
      goto LABEL_6;
    v6 = objc_alloc(MEMORY[0x1E0CEA380]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUTimerTriggerEditorNextButton"), CFSTR("HUTimerTriggerEditorNextButton"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = sel__nextButtonPressed_;
  }
  v12 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 2, self, v8);
  -[HUTimeEventEditorViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v12);

LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeOptionItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTimeEventEditorViewController timeEvent](self, "timeEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[HUTimeEventEditorViewController timeEvent](self, "timeEvent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v19, "fireTimeComponents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v20, "fireTimeComponents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController itemManager](self, "itemManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDefaultFireTimeComponents:", v22);
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v20, "fireDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v20, "fireDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "components:fromDate:", 96, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableViewController itemManager](self, "itemManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDefaultFireTimeComponents:", v23);
LABEL_20:

    goto LABEL_21;
  }
  objc_opt_class();
  v24 = objc_opt_isKindOfClass();

  if ((v24 & 1) != 0)
  {
    -[HUTimeEventEditorViewController timeEvent](self, "timeEvent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "significantEvent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB9B88]))
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sunriseOptionItem");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB9B90]))
        goto LABEL_17;
      -[HUItemTableViewController itemManager](self, "itemManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sunsetOptionItem");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v29 = (void *)v26;

    v16 = v29;
LABEL_17:
    -[HUItemTableViewController itemManager](self, "itemManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "significantEventOffset");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v23, "setDefaultOffset:forSignificantEvent:", v28, v22);
    }
    else
    {
      v30 = (void *)objc_opt_new();
      objc_msgSend(v23, "setDefaultOffset:forSignificantEvent:", v30, v22);

    }
    goto LABEL_20;
  }
LABEL_23:
  -[HUTimeEventEditorViewController setSelectedDateOptionItem:](self, "setSelectedDateOptionItem:", v16);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUTimeEventEditorViewController;
  -[HUItemTableViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "useMacIdiom"))
  {
    -[HUTimeEventEditorViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    +[HUGridLimitedWidthViewLayoutOptions defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:](HUGridLimitedWidthViewLayoutOptions, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", 1, &unk_1E7040A20, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimeEventEditorViewController setLayoutOptions:](self, "setLayoutOptions:", v7);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUTimeEventEditorViewController;
  -[HUItemTableViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  -[HUTimeEventEditorViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  -[HUTimeEventEditorViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentInset");
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[HUTimeEventEditorViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentInset:", v6, v9, v11, v13);

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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HFItem *v29;
  void *v30;
  void *v31;
  HFItem *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  HFItem *v41;
  void *v42;
  HFItem *v43;
  void *v44;
  id v45;

  p_selectedDateOptionItem = &self->_selectedDateOptionItem;
  v45 = a3;
  if ((objc_msgSend(v45, "isEqual:", *p_selectedDateOptionItem) & 1) == 0)
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
        -[HUTimeEventEditorViewController tableView](self, "tableView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cellForRowAtIndexPath:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUTimeEventEditorViewController updateCell:forItem:indexPath:animated:](self, "updateCell:forItem:indexPath:animated:", v10, v6, v8, 1);
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
      -[HUTimeEventEditorViewController triggerBuilder](self, "triggerBuilder");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTimeEventEditorViewController timeEvent](self, "timeEvent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeEventBuilder:", v28);

      -[HUTimeEventEditorViewController setTimeEvent:](self, "setTimeEvent:", 0);
LABEL_24:

      goto LABEL_25;
    }
    -[HUItemTableViewController itemManager](self, "itemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "indexPathForItem:", *p_selectedDateOptionItem);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HUTimeEventEditorViewController tableView](self, "tableView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "cellForRowAtIndexPath:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        -[HUTimeEventEditorViewController updateCell:forItem:indexPath:animated:](self, "updateCell:forItem:indexPath:animated:", v17, *p_selectedDateOptionItem, v15, 1);

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

      -[HUTimeEventEditorViewController triggerBuilder](self, "triggerBuilder");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTimeEventEditorViewController timeEvent](self, "timeEvent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeEventBuilder:", v25);

      -[HUTimeEventEditorViewController triggerBuilder](self, "triggerBuilder");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addEventBuilder:", v21);

      -[HUTimeEventEditorViewController setTimeEvent:](self, "setTimeEvent:", v21);
    }
    else
    {
      v29 = *p_selectedDateOptionItem;
      -[HUItemTableViewController itemManager](self, "itemManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "sunriseOptionItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HFItem isEqual:](v29, "isEqual:", v31))
      {

      }
      else
      {
        v32 = *p_selectedDateOptionItem;
        -[HUItemTableViewController itemManager](self, "itemManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "sunsetOptionItem");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v32) = -[HFItem isEqual:](v32, "isEqual:", v34);

        if (!(_DWORD)v32)
        {
          NSLog(CFSTR("Unhandled option item: %@"), *p_selectedDateOptionItem);
          goto LABEL_21;
        }
      }
      -[HUTimeEventEditorViewController _selectedSignificantEvent](self, "_selectedSignificantEvent");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController itemManager](self, "itemManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "defaultOffsetForSignificantEvent:", v21);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_alloc_init(MEMORY[0x1E0D317F8]);
      objc_msgSend(v37, "setSignificantEvent:", v21);
      objc_msgSend(v37, "setSignificantEventOffset:", v36);
      -[HUTimeEventEditorViewController triggerBuilder](self, "triggerBuilder");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTimeEventEditorViewController timeEvent](self, "timeEvent");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "removeEventBuilder:", v39);

      -[HUTimeEventEditorViewController triggerBuilder](self, "triggerBuilder");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addEventBuilder:", v37);

      -[HUTimeEventEditorViewController setTimeEvent:](self, "setTimeEvent:", v37);
    }

LABEL_21:
    v41 = *p_selectedDateOptionItem;
    -[HUItemTableViewController itemManager](self, "itemManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "timeOptionItem");
    v43 = (HFItem *)objc_claimAutoreleasedReturnValue();

    if (v41 == v43)
    {
      -[HUItemTableViewController itemManager](self, "itemManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setDatePickerShown:", 1);

    }
    goto LABEL_24;
  }
LABEL_25:

}

- (NSDateComponents)selectedSignificantEventOffset
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_opt_class();
  -[HUTimeEventEditorViewController timeEvent](self, "timeEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "significantEventOffset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  return (NSDateComponents *)v8;
}

- (void)setSelectedSignificantEventOffset:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  -[HUTimeEventEditorViewController timeEvent](self, "timeEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "setSignificantEventOffset:", v8);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateForSignificantEventOffsetChange");

  }
}

- (NSDateComponents)selectedFireTimeComponents
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_opt_class();
  -[HUTimeEventEditorViewController timeEvent](self, "timeEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "fireTimeComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v6;
}

- (void)setSelectedFireTimeComponents:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  -[HUTimeEventEditorViewController timeEvent](self, "timeEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
    objc_msgSend(v6, "setFireTimeComponents:", v7);

}

- (NSArray)selectedRecurrences
{
  void *v2;
  void *v3;

  -[HUTimeEventEditorViewController triggerBuilder](self, "triggerBuilder");
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
  -[HUTimeEventEditorViewController triggerBuilder](self, "triggerBuilder");
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
    -[HUTimeEventEditorViewController layoutOptions](self, "layoutOptions");
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
      -[HUTimeEventEditorViewController tableView](self, "tableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_setSectionContentInset:", v8, v10, v12, v14);

    }
  }

}

- (void)_doneButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HUTimeEventEditorViewController timeEvent](self, "timeEvent", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorViewController flow](self, "flow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventBuilderItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeEventBuilder:", v4);

  -[HUTimeEventEditorViewController flow](self, "flow");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorViewController stepIdentifier](self, "stepIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewController:didFinishStepWithIdentifier:", self, v7);

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
    -[HUTimeEventEditorViewController setSelectedFireTimeComponents:](self, "setSelectedFireTimeComponents:", v7);

    -[HUTimeEventEditorViewController selectedFireTimeComponents](self, "selectedFireTimeComponents");
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

  -[HUTimeEventEditorViewController setSelectedFireTimeComponents:](self, "setSelectedFireTimeComponents:", v8);
  -[HUTimeEventEditorViewController selectedFireTimeComponents](self, "selectedFireTimeComponents");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDefaultFireTimeComponents:", v10);

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
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v6 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "setDelegate:", self);
    objc_msgSend(v8, "setHideTitleLabel:", 1);
    +[HUIconCellContentMetrics defaultMetrics](HUIconCellContentMetrics, "defaultMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconSize");
    objc_msgSend(v8, "setLeftMargin:");

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

    -[HUTimeEventEditorViewController selectedDateOptionItem](self, "selectedDateOptionItem");
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
    -[HUTimeEventEditorViewController selectedRecurrences](self, "selectedRecurrences");
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

    -[HUTimeEventEditorViewController selectedFireTimeComponents](self, "selectedFireTimeComponents");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTimeComponents:", v39);

  }
LABEL_23:
  v42.receiver = self;
  v42.super_class = (Class)HUTimeEventEditorViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v42, sel_updateCell_forItem_indexPath_animated_, v10, v11, v12, v6);

}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[HUTimeEventEditorViewController _instructionsSectionIDs](self, "_instructionsSectionIDs");
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

  -[HUTimeEventEditorViewController _instructionsSectionIDs](self, "_instructionsSectionIDs");
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
  v3[0] = CFSTR("HUTimeEventEditorSectionIdentifierInstructions");
  v3[1] = CFSTR("HUTimeEventEditorSectionIdentifierRepeatInstructions");
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
    v15.super_class = (Class)HUTimeEventEditorViewController;
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
  v11.super_class = (Class)HUTimeEventEditorViewController;
  -[HUItemTableViewController tableView:accessoryButtonTappedForRowWithIndexPath:](&v11, sel_tableView_accessoryButtonTappedForRowWithIndexPath_, a3, a4);
  v5 = [HUTimeEventOffsetEditorViewController alloc];
  -[HUTimeEventEditorViewController _selectedSignificantEvent](self, "_selectedSignificantEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorViewController selectedSignificantEventOffset](self, "selectedSignificantEventOffset");
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
  v14.super_class = (Class)HUTimeEventEditorViewController;
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
      -[HUTimeEventEditorViewController setSelectedDateOptionItem:](self, "setSelectedDateOptionItem:", v9);
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
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("HUTimeEventEditorSectionIdentifierRepeat"));

  if (v8)
  {
    -[HUTimeEventEditorViewController _localizedRecurrenceDescription](self, "_localizedRecurrenceDescription");
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
  _QWORD v6[5];

  objc_msgSend(a4, "allObjects", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorViewController setSelectedRecurrences:](self, "setSelectedRecurrences:", v5);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__HUTimeEventEditorViewController_dayOfWeekPickerCell_didChangeSelectedRecurrences___block_invoke;
  v6[3] = &unk_1E6F4D988;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v6);
}

void __84__HUTimeEventEditorViewController_dayOfWeekPickerCell_didChangeSelectedRecurrences___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginUpdates");

  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUTimeEventEditorSectionIdentifierRepeat"));

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "footerViewForSection:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_localizedRecurrenceDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v9, "sizeToFit");
  objc_msgSend(v9, "setClipsToBounds:", 1);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endUpdates");

}

- (void)timerTriggerOffsetEditor:(id)a3 didFinishWithOffset:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimeEventEditorViewController _selectedSignificantEvent](self, "_selectedSignificantEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultOffset:forSignificantEvent:", v5, v7);

  -[HUTimeEventEditorViewController setSelectedSignificantEventOffset:](self, "setSelectedSignificantEventOffset:", v5);
  -[HUTimeEventEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)timerTriggerOffsetEditorDidCancel:(id)a3
{
  -[HUTimeEventEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_localizedRecurrenceDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CBA910];
  -[HUTimeEventEditorViewController selectedRecurrences](self, "selectedRecurrences");
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
  return 1;
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

  if (-[HUTimeEventEditorViewController _canCommitTriggerBuilder](self, "_canCommitTriggerBuilder")
    && -[HUTimeEventEditorViewController _canContinue](self, "_canContinue"))
  {
    -[HUTimeEventEditorViewController triggerBuilder](self, "triggerBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "commitItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (id)objc_msgSend(v7, "addFailureBlock:", &__block_literal_global_75);
    v5 = v7;
  }
  return v5;
}

void __56__HUTimeEventEditorViewController__commitTriggerBuilder__block_invoke(uint64_t a1, void *a2)
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

  -[HUTimeEventEditorViewController selectedDateOptionItem](self, "selectedDateOptionItem");
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
    -[HUTimeEventEditorViewController selectedDateOptionItem](self, "selectedDateOptionItem");
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
  -[HUTimeEventEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (HFTimeEventBuilder)timeEvent
{
  return self->_timeEvent;
}

- (void)setTimeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_timeEvent, a3);
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_triggerBuilder, a3);
}

- (HFItem)selectedDateOptionItem
{
  return self->_selectedDateOptionItem;
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (HUEventUIFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
  objc_storeStrong((id *)&self->_flow, a3);
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stepIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_selectedDateOptionItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
  objc_storeStrong((id *)&self->_timeEvent, 0);
}

@end
