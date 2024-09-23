@implementation HUTemperatureUnitPickerViewController

- (HUTemperatureUnitPickerViewController)initWithUnitItem:(id)a3
{
  id v5;
  HUTemperatureUnitPickerViewController *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUTemperatureUnitPickerViewController;
  v6 = -[HUTemperatureUnitPickerViewController initWithStyle:](&v15, sel_initWithStyle_, 2);
  if (v6)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUTemperatureUnitTitle"), CFSTR("HUTemperatureUnitTitle"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTemperatureUnitPickerViewController setTitle:](v6, "setTitle:", v7);

    v8 = objc_alloc(MEMORY[0x1E0D31810]);
    v9 = (void *)objc_msgSend(v5, "copy");
    v10 = (void *)objc_msgSend(v8, "initWithDelegate:sourceItem:", v6, v9);
    -[HUTemperatureUnitPickerViewController setItemManager:](v6, "setItemManager:", v10);

    -[HUTemperatureUnitPickerViewController itemManager](v6, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUseCustomDiffableDataSource:", 1);

    -[HUTemperatureUnitPickerViewController itemManager](v6, "itemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUTemperatureUnitPickerViewController;
  -[HUTemperatureUnitPickerViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[HUTemperatureUnitPickerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v6);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "row");
  v12 = -[HUTemperatureUnitPickerViewController _tableRowToTemperatureUnit:](self, "_tableRowToTemperatureUnit:", v11);
  -[HUTemperatureUnitPickerViewController _controlItem](self, "_controlItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "latestResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v16 = CFSTR("HUTemperatureUnitDegreesFahrenheit");
  else
    v16 = CFSTR("HUTemperatureUnitDegreesCelsius");
  _HULocalizedStringWithDefaultValue(v16, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v17);

  if (v15 && objc_msgSend(v15, "integerValue") == v12)
    v19 = 3;
  else
    v19 = 0;
  objc_msgSend(v10, "setAccessoryType:", v19);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  int64_t v5;
  void *v6;
  id v7;
  id v8;

  v5 = -[HUTemperatureUnitPickerViewController _tableRowToTemperatureUnit:](self, "_tableRowToTemperatureUnit:", objc_msgSend(a4, "row", a3));
  -[HUTemperatureUnitPickerViewController _controlItem](self, "_controlItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "writeValue:", v6);

}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  void *v4;
  id v5;

  -[HUTemperatureUnitPickerViewController tableView](self, "tableView", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadSections:withRowAnimation:", v4, 5);

}

- (id)_controlItem
{
  void *v2;
  void *v3;

  -[HUTemperatureUnitPickerViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_tableRowToTemperatureUnit:(unint64_t)a3
{
  return a3 == 1;
}

- (HFSimpleItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_itemManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemManager, 0);
}

@end
