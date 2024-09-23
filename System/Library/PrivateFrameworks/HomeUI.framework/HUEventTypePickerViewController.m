@implementation HUEventTypePickerViewController

- (HUEventTypePickerViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4
{
  id v6;
  id v7;
  HUEventTypePickerItemManager *v8;
  void *v9;
  HUEventTypePickerItemManager *v10;
  HUEventTypePickerViewController *v11;
  HUEventTypePickerViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v8 = [HUEventTypePickerItemManager alloc];
  objc_msgSend(v6, "triggerBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUEventTypePickerItemManager initWithTriggerBuilder:delegate:](v8, "initWithTriggerBuilder:delegate:", v9, self);

  v19.receiver = self;
  v19.super_class = (Class)HUEventTypePickerViewController;
  v11 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v19, sel_initWithItemManager_tableViewStyle_, v10, 1);
  v12 = v11;
  if (v11)
  {
    -[HUEventTypePickerViewController setFlow:](v11, "setFlow:", v6);
    -[HUEventTypePickerViewController setStepIdentifier:](v12, "setStepIdentifier:", v7);
    _HULocalizedStringWithDefaultValue(CFSTR("HUEventTypePickerTitle"), CFSTR("HUEventTypePickerTitle"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEventTypePickerViewController setTitle:](v12, "setTitle:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, v12, sel__cancel_);
    -[HUEventTypePickerViewController navigationItem](v12, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLeftBarButtonItem:", v14);

    _HULocalizedStringWithDefaultValue(CFSTR("HUBackButtonTitle"), CFSTR("HUBackButtonTitle"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEventTypePickerViewController navigationItem](v12, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackButtonTitle:", v16);

  }
  return v12;
}

- (void)_cancel:(id)a3
{
  void *v4;
  id v5;

  -[HUEventTypePickerViewController flow](self, "flow", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUEventTypePickerViewController stepIdentifier](self, "stepIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController:didCancelStepWithIdentifier:", self, v4);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4;

  v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  return (Class)(id)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  double v17;
  objc_super v18;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "latestResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    v16 = v10;
    objc_msgSend(v16, "setDisabled:", v15);
    objc_msgSend(v16, "setAccessoryType:", v15 ^ 1);
    if ((_DWORD)v15)
      v17 = 0.200000003;
    else
      v17 = 1.0;
    objc_msgSend(v16, "setIconAlpha:", v17);
    objc_msgSend(v16, "setTextAlpha:", v17);
    objc_msgSend(v16, "setIconDisplayStyle:", 1);

  }
  v18.receiver = self;
  v18.super_class = (Class)HUEventTypePickerViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v18, sel_updateCell_forItem_indexPath_animated_, v10, v11, v12, v6);

}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedSectionIdentifierForSectionIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HUEventTypePickerSectionIdentifierInstructions"));

  return v6;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedSectionIdentifierForSectionIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HUEventTypePickerSectionIdentifierInstructions"));

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HUEventTypePickerViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v27, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12
    || (-[HUItemTableViewController itemManager](self, "itemManager"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "instructionsItem"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v9 == v14))
  {
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 0);
  }
  else
  {
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    -[HUItemTableViewController itemManager](self, "itemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timerEventItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v16)
    {
      v25 = 3;
      goto LABEL_14;
    }
    -[HUItemTableViewController itemManager](self, "itemManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leavingLocationEventItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v18)
    {
      v25 = 2;
      goto LABEL_14;
    }
    -[HUItemTableViewController itemManager](self, "itemManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrivingAtLocationEventItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v20)
    {
      v25 = 1;
      goto LABEL_14;
    }
    -[HUItemTableViewController itemManager](self, "itemManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "characteristicEventItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v22)
    {
      v25 = 4;
      goto LABEL_14;
    }
    -[HUItemTableViewController itemManager](self, "itemManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "alarmEventItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v24)
    {
      v25 = 5;
LABEL_14:
      -[HUEventTypePickerViewController flow](self, "flow");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "viewController:didSelectEventType:", self, v25);

    }
  }

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
}

@end
