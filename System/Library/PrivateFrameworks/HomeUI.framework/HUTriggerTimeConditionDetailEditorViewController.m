@implementation HUTriggerTimeConditionDetailEditorViewController

- (HUTriggerTimeConditionDetailEditorViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemManager_tableViewStyle_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerTimeConditionDetailEditorViewController.m"), 30, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUTriggerTimeConditionDetailEditorViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUTriggerTimeConditionDetailEditorViewController)initWithRangeCondition:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  HUTriggerTimeConditionDetailEditorItemManager *v8;
  HUTriggerTimeConditionDetailEditorViewController *v9;
  HUTriggerTimeConditionDetailEditorViewController *v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  v8 = -[HUTriggerTimeConditionDetailEditorItemManager initWithDelegate:rangeCondition:]([HUTriggerTimeConditionDetailEditorItemManager alloc], "initWithDelegate:rangeCondition:", self, v7);

  v12.receiver = self;
  v12.super_class = (Class)HUTriggerTimeConditionDetailEditorViewController;
  v9 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v12, sel_initWithItemManager_tableViewStyle_, v8, 1);
  v10 = v9;
  if (v9)
    objc_storeWeak((id *)&v9->_delegate, v6);

  return v10;
}

- (HFTimeRangeCondition)rangeCondition
{
  void *v2;
  void *v3;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rangeCondition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFTimeRangeCondition *)v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUTriggerTimeConditionDetailEditorViewController;
  -[HUItemTableViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[HUTriggerTimeConditionDetailEditorViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSeparatorStyle:", 1);

  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerTimeConditionDetailEditorTitle"), CFSTR("HUTriggerTimeConditionDetailEditorTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTimeConditionDetailEditorViewController setTitle:](self, "setTitle:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel_);
  -[HUTriggerTimeConditionDetailEditorViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
  -[HUTriggerTimeConditionDetailEditorViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

}

- (void)_cancel:(id)a3
{
  id v4;

  -[HUTriggerTimeConditionDetailEditorViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeConditionEditorDidCancel:", self);

}

- (void)_done:(id)a3
{
  void *v4;
  id v5;

  -[HUTriggerTimeConditionDetailEditorViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTimeConditionDetailEditorViewController rangeCondition](self, "rangeCondition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeConditionEditor:didFinishWithCondition:", self, v4);

}

- (id)allCellClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primitiveConditionForPickerItem:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSLog(CFSTR("Unrecognized primitive condition type %@"), v7);
    v8 = 0;
  }

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  objc_super v10;

  v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUTriggerTimeConditionDetailEditorViewController;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v10, sel_setupCell_forItem_indexPath_, v8, a4, a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setDelegate:", self);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      objc_msgSend(v9, "setDelegate:", self);
      objc_msgSend(v9, "setHideTitleLabel:", 1);

    }
  }

}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  objc_super v29;

  v6 = a6;
  v10 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HUTriggerTimeConditionDetailEditorViewController;
  v11 = a4;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v29, sel_updateCell_forItem_indexPath_animated_, v10, v11, a5, v6);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primitiveConditionForPickerItem:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_opt_class();
    v15 = v10;
    if (v15)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v15;
      if (v16)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v14, objc_opt_class(), v29.receiver, v29.super_class);

    }
    v17 = 0;
LABEL_9:

    objc_msgSend(v13, "dateComponents");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTimeComponents:", v20);
LABEL_22:

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = objc_opt_class();
    v22 = v10;
    if (v22)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
      v17 = v22;
      if (v23)
        goto LABEL_18;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v21, objc_opt_class(), v29.receiver, v29.super_class);

    }
    v17 = 0;
LABEL_18:

    v20 = v13;
    objc_msgSend(v20, "significantEvent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSignificantEvent:", v26);

    objc_msgSend(v20, "offset");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_msgSend(v17, "setCurrentOffset:", v27);
    }
    else
    {
      v28 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v17, "setCurrentOffset:", v28);

    }
    goto LABEL_22;
  }
LABEL_23:

}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  objc_super v12;

  v4 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startConditionPickerItem");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((id)v6 == v4)
  {

    goto LABEL_5;
  }
  v7 = (void *)v6;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endConditionPickerItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
LABEL_5:
    v10 = 1;
    goto LABEL_6;
  }
  v12.receiver = self;
  v12.super_class = (Class)HUTriggerTimeConditionDetailEditorViewController;
  v10 = -[HUItemTableViewController automaticDisablingReasonsForItem:](&v12, sel_automaticDisablingReasonsForItem_, v4);
LABEL_6:

  return v10;
}

- (void)significantEventOffsetPicker:(id)a3 didSelectOffset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v6 = a4;
  v7 = a3;
  -[HUTriggerTimeConditionDetailEditorViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForCell:", v7);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedItemAtIndexPath:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primitiveConditionForPickerItem:", v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v13;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v11, objc_opt_class());

LABEL_7:
    v15 = 0;
  }

  v18 = objc_alloc(MEMORY[0x1E0D31878]);
  objc_msgSend(v15, "significantEvent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithSignificantEvent:offset:comparisonType:", v19, v6, objc_msgSend(v15, "comparisonType"));

  -[HUItemTableViewController itemManager](self, "itemManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPrimitiveCondition:forPickerItem:", v20, v10);

}

- (void)datePickerCell:(id)a3 didSelectDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v6 = a4;
  v7 = a3;
  -[HUTriggerTimeConditionDetailEditorViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForCell:", v7);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedItemAtIndexPath:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "components:fromDate:", 96, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_opt_class();
  -[HUItemTableViewController itemManager](self, "itemManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "primitiveConditionForPickerItem:", v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v15;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v13, objc_opt_class());

LABEL_7:
    v17 = 0;
  }

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31350]), "initWithDateComponents:comparisonType:", v12, objc_msgSend(v17, "comparisonType"));
  -[HUItemTableViewController itemManager](self, "itemManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPrimitiveCondition:forPickerItem:", v20, v10);

}

- (HUTriggerTimeConditionDetailEditorDelegate)delegate
{
  return (HUTriggerTimeConditionDetailEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
