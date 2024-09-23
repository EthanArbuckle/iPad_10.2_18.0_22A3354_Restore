@implementation WDElectrocardiogramInternalSettingsViewController

- (WDElectrocardiogramInternalSettingsViewController)initWithHealthStore:(id)a3 dateCache:(id)a4
{
  id v7;
  id v8;
  WDElectrocardiogramInternalSettingsViewController *v9;
  WDElectrocardiogramInternalSettingsViewController *v10;
  uint64_t v11;
  HKKeyValueDomain *keyValueDomain;
  NPSManager *v13;
  NPSManager *syncManager;
  void *v15;
  uint64_t v16;
  NSArray *demoResultKeys;
  uint64_t v18;
  HKHeartRhythmAvailability *heartRhythmAvailability;
  uint64_t v20;
  NSArray *allAlgorithmVersions;
  objc_super v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)WDElectrocardiogramInternalSettingsViewController;
  v9 = -[WDElectrocardiogramInternalSettingsViewController initWithStyle:](&v23, sel_initWithStyle_, 1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateCache, a4);
    objc_storeStrong((id *)&v10->_healthStore, a3);
    objc_msgSend(MEMORY[0x24BDD3C98], "heartRhythmDefaultsDomainWithHealthStore:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    keyValueDomain = v10->_keyValueDomain;
    v10->_keyValueDomain = (HKKeyValueDomain *)v11;

    v13 = (NPSManager *)objc_alloc_init(MEMORY[0x24BE6B2C8]);
    syncManager = v10->_syncManager;
    v10->_syncManager = v13;

    objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hk_demoResultKeys");
    v16 = objc_claimAutoreleasedReturnValue();
    demoResultKeys = v10->_demoResultKeys;
    v10->_demoResultKeys = (NSArray *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3C70]), "initWithHealthStore:", v7);
    heartRhythmAvailability = v10->_heartRhythmAvailability;
    v10->_heartRhythmAvailability = (HKHeartRhythmAvailability *)v18;

    v24[0] = CFSTR("No override");
    v24[1] = CFSTR("ECG 1");
    v24[2] = CFSTR("ECG 2");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
    v20 = objc_claimAutoreleasedReturnValue();
    allAlgorithmVersions = v10->_allAlgorithmVersions;
    v10->_allAlgorithmVersions = (NSArray *)v20;

    -[HKHeartRhythmAvailability addHeartRhythmAvailabilityObserver:](v10->_heartRhythmAvailability, "addHeartRhythmAvailabilityObserver:", v10);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[HKHeartRhythmAvailability removeHeartRhythmAvailabilityObserver:](self->_heartRhythmAvailability, "removeHeartRhythmAvailabilityObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)WDElectrocardiogramInternalSettingsViewController;
  -[WDElectrocardiogramInternalSettingsViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  id v3;
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WDElectrocardiogramInternalSettingsViewController;
  -[HKTableViewController viewDidLoad](&v14, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x24BDF6C58]);
  -[WDElectrocardiogramInternalSettingsViewController setAlgorithmVersionPicker:](self, "setAlgorithmVersionPicker:", v3);

  -[WDElectrocardiogramInternalSettingsViewController algorithmVersionPicker](self, "algorithmVersionPicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", self);

  -[WDElectrocardiogramInternalSettingsViewController algorithmVersionPicker](self, "algorithmVersionPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[WDElectrocardiogramInternalSettingsViewController algorithmVersionPicker](self, "algorithmVersionPicker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectRow:inComponent:animated:", -[WDElectrocardiogramInternalSettingsViewController _overrideAlgorithmVersion](self, "_overrideAlgorithmVersion"), 0, 0);

  v7 = (void *)MEMORY[0x24BE4A680];
  -[WDElectrocardiogramInternalSettingsViewController algorithmVersionPicker](self, "algorithmVersionPicker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewHostingView:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramInternalSettingsViewController setAlgorithmVersionPickerInputView:](self, "setAlgorithmVersionPickerInputView:", v9);

  -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setKeyboardDismissMode:", 1);

  -[WDElectrocardiogramInternalSettingsViewController editButtonItem](self, "editButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramInternalSettingsViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightBarButtonItem:", v11);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_keyboardDidDismiss_, *MEMORY[0x24BDF7B78], 0);

  -[WDElectrocardiogramInternalSettingsViewController reloadKeyValueDomainContent](self, "reloadKeyValueDomainContent");
}

- (void)reloadKeyValueDomainContent
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[WDElectrocardiogramInternalSettingsViewController keyValueDomain](self, "keyValueDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__WDElectrocardiogramInternalSettingsViewController_reloadKeyValueDomainContent__block_invoke;
  v4[3] = &unk_24D38E048;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "allValuesWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __80__WDElectrocardiogramInternalSettingsViewController_reloadKeyValueDomainContent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __80__WDElectrocardiogramInternalSettingsViewController_reloadKeyValueDomainContent__block_invoke_2;
  v5[3] = &unk_24D38D0C8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __80__WDElectrocardiogramInternalSettingsViewController_reloadKeyValueDomainContent__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id *v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_filter:", &__block_literal_global_9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setKeyValueDomainContentKeys:", v4);

  v7 = *(_QWORD *)(a1 + 32);
  v8 = objc_loadWeakRetained(v5);
  objc_msgSend(v8, "setKeyValueDomainContent:", v7);

  v11 = objc_loadWeakRetained(v5);
  objc_msgSend(v11, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadSections:withRowAnimation:", v10, 100);

}

uint64_t __80__WDElectrocardiogramInternalSettingsViewController_reloadKeyValueDomainContent__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("HKElectrocardiogram"));
}

- (void)setDemoResultKeys:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)&self->_demoResultKeys, a3);
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_setDemoResultKeys:", v5);

  -[WDElectrocardiogramInternalSettingsViewController syncManager](self, "syncManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDD4678];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("DemoResultKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "synchronizeUserDefaultsDomain:keys:", v7, v8);
}

- (UIPickerView)resultPicker
{
  UIPickerView *resultPicker;
  UIPickerView *v4;
  UIPickerView *v5;

  resultPicker = self->_resultPicker;
  if (!resultPicker)
  {
    v4 = (UIPickerView *)objc_alloc_init(MEMORY[0x24BDF6C58]);
    v5 = self->_resultPicker;
    self->_resultPicker = v4;

    -[UIPickerView setDataSource:](self->_resultPicker, "setDataSource:", self);
    -[UIPickerView setDelegate:](self->_resultPicker, "setDelegate:", self);
    resultPicker = self->_resultPicker;
  }
  return resultPicker;
}

- (HKHostingAreaLayoutView)pickerInputView
{
  HKHostingAreaLayoutView *pickerInputView;
  void *v4;
  void *v5;
  HKHostingAreaLayoutView *v6;
  HKHostingAreaLayoutView *v7;

  pickerInputView = self->_pickerInputView;
  if (!pickerInputView)
  {
    v4 = (void *)MEMORY[0x24BE4A680];
    -[WDElectrocardiogramInternalSettingsViewController resultPicker](self, "resultPicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewHostingView:", v5);
    v6 = (HKHostingAreaLayoutView *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pickerInputView;
    self->_pickerInputView = v6;

    pickerInputView = self->_pickerInputView;
  }
  return pickerInputView;
}

- (NSArray)allDemoResults
{
  NSArray *allDemoResults;

  allDemoResults = self->_allDemoResults;
  if (!allDemoResults)
  {
    self->_allDemoResults = (NSArray *)&unk_24D3A6320;

    allDemoResults = self->_allDemoResults;
  }
  return allDemoResults;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDElectrocardiogramInternalSettingsViewController;
  -[WDElectrocardiogramInternalSettingsViewController setEditing:animated:](&v6, sel_setEditing_animated_, a3, a4);
  if (!a3)
    -[WDElectrocardiogramInternalSettingsViewController updateCellIndexNumberLabels](self, "updateCellIndexNumberLabels");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = a3;
  v7 = 1;
  switch(a4)
  {
    case 0:
      -[WDElectrocardiogramInternalSettingsViewController demoResultKeys](self, "demoResultKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "count") + 1;

      break;
    case 2:
    case 3:
      v7 = 2;
      break;
    case 4:
      -[WDElectrocardiogramInternalSettingsViewController keyValueDomainContentKeys](self, "keyValueDomainContentKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10 <= 1)
        v7 = 1;
      else
        v7 = v10;
      break;
    default:
      break;
  }

  return v7;
}

- (id)_buttonCellForTableView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ButtonCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("ButtonCell"));
    objc_msgSend(MEMORY[0x24BDF6950], "hk_appKeyColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

  }
  return v3;
}

- (id)_styleValue1CellForTableView:(id)a3 inputView:(id)a4
{
  id v5;
  WDProfileTableViewCell *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("AlgorithmVersionReuseIdentifier"));
  v6 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[WDProfileTableViewCell initWithStyle:reuseIdentifier:]([WDProfileTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("AlgorithmVersionReuseIdentifier"));
    -[WDProfileTableViewCell setInputView:](v6, "setInputView:", v5);
    objc_msgSend(MEMORY[0x24BDF6950], "hk_appKeyColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDProfileTableViewCell displayNameLabel](v6, "displayNameLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

  }
  return v6;
}

- (id)_styleSubtitleCellForTableView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("SubtitleCellStyleReuseIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 3, CFSTR("SubtitleCellStyleReuseIdentifier"));
    objc_msgSend(MEMORY[0x24BDF6950], "hk_appKeyColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

    objc_msgSend(v3, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

  }
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  WDProfileTableViewCell *v4;
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v7 = a3;
  v8 = a4;
  switch(objc_msgSend(v8, "section"))
  {
    case 0:
      v9 = objc_msgSend(v8, "row");
      -[WDElectrocardiogramInternalSettingsViewController demoResultKeys](self, "demoResultKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v9 >= v11)
      {
        -[WDElectrocardiogramInternalSettingsViewController _buttonCellForTableView:](self, "_buttonCellForTableView:", v7);
        v4 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
        -[WDProfileTableViewCell textLabel](v4, "textLabel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v18;
        v19 = CFSTR("Add Result");
        goto LABEL_21;
      }
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("DemoResult"));
      v4 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        v4 = -[WDProfileTableViewCell initWithStyle:reuseIdentifier:]([WDProfileTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("DemoResult"));
        -[WDElectrocardiogramInternalSettingsViewController pickerInputView](self, "pickerInputView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDProfileTableViewCell setInputView:](v4, "setInputView:", v12);

      }
      v13 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "row") + 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringFromNumber:numberStyle:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDProfileTableViewCell setDisplayName:](v4, "setDisplayName:", v15);

      -[WDElectrocardiogramInternalSettingsViewController demoResultKeys](self, "demoResultKeys");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDProfileTableViewCell setDisplayValue:](v4, "setDisplayValue:", v17);
      goto LABEL_9;
    case 1:
      -[WDElectrocardiogramInternalSettingsViewController _buttonCellForTableView:](self, "_buttonCellForTableView:", v7);
      v4 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
      -[WDProfileTableViewCell textLabel](v4, "textLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v18;
      v19 = CFSTR("Delete All ECG Readings");
      goto LABEL_21;
    case 2:
      if (!objc_msgSend(v8, "row"))
      {
        -[WDElectrocardiogramInternalSettingsViewController _buttonCellForTableView:](self, "_buttonCellForTableView:", v7);
        v4 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
        -[WDProfileTableViewCell textLabel](v4, "textLabel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v18;
        v19 = CFSTR("Reset Onboarding History");
        goto LABEL_21;
      }
      -[WDElectrocardiogramInternalSettingsViewController algorithmVersionPickerInputView](self, "algorithmVersionPickerInputView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDElectrocardiogramInternalSettingsViewController _styleValue1CellForTableView:inputView:](self, "_styleValue1CellForTableView:inputView:", v7, v20);
      v4 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();

      -[WDProfileTableViewCell setDisplayName:](v4, "setDisplayName:", CFSTR("Next Onboarding Override:"));
      -[WDElectrocardiogramInternalSettingsViewController allAlgorithmVersions](self, "allAlgorithmVersions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", -[WDElectrocardiogramInternalSettingsViewController _overrideAlgorithmVersion](self, "_overrideAlgorithmVersion"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDProfileTableViewCell detailTextLabel](v4, "detailTextLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setText:", v17);

LABEL_9:
      break;
    case 3:
      v22 = objc_msgSend(v8, "row");
      -[WDElectrocardiogramInternalSettingsViewController _buttonCellForTableView:](self, "_buttonCellForTableView:", v7);
      v4 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
      -[WDProfileTableViewCell textLabel](v4, "textLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v18;
      if (v22)
        v19 = CFSTR("Start Upgrade");
      else
        v19 = CFSTR("Start Full Onboarding");
      goto LABEL_21;
    case 4:
      -[WDElectrocardiogramInternalSettingsViewController _styleSubtitleCellForTableView:](self, "_styleSubtitleCellForTableView:", v7);
      v4 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
      -[WDElectrocardiogramInternalSettingsViewController keyValueDomainContentKeys](self, "keyValueDomainContentKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      if (v24)
      {
        -[WDElectrocardiogramInternalSettingsViewController keyValueDomainContentKeys](self, "keyValueDomainContentKeys");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[WDElectrocardiogramInternalSettingsViewController keyValueDomainContent](self, "keyValueDomainContent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v16);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "substringFromIndex:", objc_msgSend(CFSTR("HKElectrocardiogram"), "length"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDProfileTableViewCell textLabel](v4, "textLabel");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setText:", v28);

        -[WDElectrocardiogramInternalSettingsViewController displayableDescriptionFromValue:](self, "displayableDescriptionFromValue:", v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDProfileTableViewCell detailTextLabel](v4, "detailTextLabel");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setText:", v30);

      }
      else
      {
        -[WDProfileTableViewCell textLabel](v4, "textLabel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setText:", CFSTR("N/A"));

LABEL_20:
        -[WDProfileTableViewCell detailTextLabel](v4, "detailTextLabel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v18;
        v19 = 0;
LABEL_21:
        objc_msgSend(v18, "setText:", v19);
      }
      break;
    case 5:
      -[WDElectrocardiogramInternalSettingsViewController _styleValue1CellForTableView:inputView:](self, "_styleValue1CellForTableView:inputView:", v7, 0);
      v4 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
      -[WDProfileTableViewCell setAccessoryType:](v4, "setAccessoryType:", 1);
      -[WDProfileTableViewCell setDisplayName:](v4, "setDisplayName:", CFSTR("Remote Feature Availability"));
      goto LABEL_20;
    default:
      goto LABEL_23;
  }

LABEL_23:
  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4;
  double result;

  v4 = objc_msgSend(a4, "section", a3);
  result = 44.0;
  if (v4 == 4)
    return 60.0;
  return result;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a4, "section", a3);
  if (v5 == 4)
    return 0;
  if (v5 == 1)
    return !-[WDElectrocardiogramInternalSettingsViewController isDeletingSamples](self, "isDeletingSamples");
  return 1;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;
  unint64_t v7;
  void *v8;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(v5, "row");
    -[WDElectrocardiogramInternalSettingsViewController demoResultKeys](self, "demoResultKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 < objc_msgSend(v8, "count");

  }
  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4 == 1 && !objc_msgSend(v9, "section"))
  {
    v11 = objc_msgSend(v10, "row");
    -[WDElectrocardiogramInternalSettingsViewController demoResultKeys](self, "demoResultKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v11 < v13)
    {
      -[WDElectrocardiogramInternalSettingsViewController demoResultKeys](self, "demoResultKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v15, "removeObjectAtIndex:", objc_msgSend(v10, "row"));
      -[WDElectrocardiogramInternalSettingsViewController setDemoResultKeys:](self, "setDemoResultKeys:", v15);
      v17[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", v16, 0);

      -[WDElectrocardiogramInternalSettingsViewController updateCellIndexNumberLabels](self, "updateCellIndexNumberLabels");
    }
  }

}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  if (!objc_msgSend(v11, "section") && !objc_msgSend(v7, "section"))
  {
    -[WDElectrocardiogramInternalSettingsViewController demoResultKeys](self, "demoResultKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v11, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", objc_msgSend(v11, "row"));
    objc_msgSend(v9, "insertObject:atIndex:", v10, objc_msgSend(v7, "row"));
    -[WDElectrocardiogramInternalSettingsViewController setDemoResultKeys:](self, "setDemoResultKeys:", v9);

  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;
  unint64_t v7;
  void *v8;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(v5, "row");
    -[WDElectrocardiogramInternalSettingsViewController demoResultKeys](self, "demoResultKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 < objc_msgSend(v8, "count");

  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEditing") & 1) == 0)
  {
    switch(objc_msgSend(v7, "section"))
    {
      case 0:
        v8 = objc_msgSend(v7, "row");
        -[WDElectrocardiogramInternalSettingsViewController demoResultKeys](self, "demoResultKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v8 >= v10)
        {
          -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
          v34[3] = &unk_24D38CEC0;
          v34[4] = self;
          v35 = v7;
          objc_msgSend(v30, "performBatchUpdates:completion:", v34, &__block_literal_global_261);

        }
        else
        {
          objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            -[WDElectrocardiogramInternalSettingsViewController allDemoResults](self, "allDemoResults");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[WDElectrocardiogramInternalSettingsViewController demoResultKeys](self, "demoResultKeys");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v13, "indexOfObject:", v15);

            if (v16 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_16;
            -[WDElectrocardiogramInternalSettingsViewController resultPicker](self, "resultPicker");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }
        }
        break;
      case 1:
        -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "endEditing:", 0);

        -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "deselectRowAtIndexPath:animated:", v7, 1);

        if (!-[WDElectrocardiogramInternalSettingsViewController isDeletingSamples](self, "isDeletingSamples"))
        {
          -[WDElectrocardiogramInternalSettingsViewController setDeletingSamples:](self, "setDeletingSamples:", 1);
          objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, CFSTR("Delete All ECG Samples"), 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v33[0] = MEMORY[0x24BDAC760];
          v33[1] = 3221225472;
          v33[2] = __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
          v33[3] = &unk_24D38D350;
          v33[4] = self;
          objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("Delete All"), 2, v33);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addAction:", v20);

          objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addAction:", v21);

          -[WDElectrocardiogramInternalSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
          goto LABEL_17;
        }
        break;
      case 2:
        if (objc_msgSend(v7, "row"))
        {
          if (objc_msgSend(v7, "row") == 1)
          {
            objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
            v22 = objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v12 = (void *)v22;
              -[WDElectrocardiogramInternalSettingsViewController allAlgorithmVersions](self, "allAlgorithmVersions");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "detailTextLabel");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "text");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v23, "indexOfObject:", v25);

              if (v16 != 0x7FFFFFFFFFFFFFFFLL)
              {
                -[WDElectrocardiogramInternalSettingsViewController algorithmVersionPicker](self, "algorithmVersionPicker");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
                v26 = v17;
                objc_msgSend(v17, "selectRow:inComponent:animated:", v16, 0, 0);

              }
LABEL_16:
              objc_msgSend(v12, "becomeFirstResponder");
LABEL_17:

            }
          }
        }
        else
        {
          -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "endEditing:", 0);

          -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "deselectRowAtIndexPath:animated:", v7, 1);

          -[WDElectrocardiogramInternalSettingsViewController _resetOnboarding](self, "_resetOnboarding");
        }
        break;
      case 3:
        -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "deselectRowAtIndexPath:animated:", v7, 1);

        if (objc_msgSend(v7, "row"))
          -[WDElectrocardiogramInternalSettingsViewController _startUpgrade](self, "_startUpgrade");
        else
          -[WDElectrocardiogramInternalSettingsViewController _startFullOnboarding](self, "_startFullOnboarding");
        break;
      case 5:
        -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "endEditing:", 0);

        -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "deselectRowAtIndexPath:animated:", v7, 1);

        -[WDElectrocardiogramInternalSettingsViewController _presentAvailabilityInternalSettingsViewController](self, "_presentAvailabilityInternalSettingsViewController");
        break;
      default:
        break;
    }
  }

}

void __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing:", 0);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);

  objc_msgSend(*(id *)(a1 + 32), "demoResultKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "allDemoResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "setDemoResultKeys:", v5);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertRowsAtIndexPaths:withRowAnimation:", v9, 100);

}

void __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "healthStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3B80], "electrocardiogramType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
  v5[3] = &unk_24D38CFB0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "deleteAllSamplesWithTypes:sourceBundleIdentifier:options:completion:", v4, 0, 2, v5);

}

void __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5;
  block[3] = &unk_24D38D000;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __87__WDElectrocardiogramInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeletingSamples:", 0);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  const __CFString *v4;

  v4 = CFSTR("HK Key Value Domain");
  if (a4 != 4)
    v4 = 0;
  if (a4)
    return (id)v4;
  else
    return CFSTR("Demo Result Order");
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  if (a4 == 2)
  {
    -[WDElectrocardiogramInternalSettingsViewController heartRhythmAvailability](self, "heartRhythmAvailability");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion");

    if (v9)
    {
      -[WDElectrocardiogramInternalSettingsViewController heartRhythmAvailability](self, "heartRhythmAvailability");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "electrocardiogramOnboardingCompletedVersionNoCache");

      -[WDElectrocardiogramInternalSettingsViewController _onboardingCompletedAlgorithmVersion](self, "_onboardingCompletedAlgorithmVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDElectrocardiogramInternalSettingsViewController heartRhythmAvailability](self, "heartRhythmAvailability");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "electrocardiogramOnboardingCountryCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[WDElectrocardiogramInternalSettingsViewController heartRhythmAvailability](self, "heartRhythmAvailability");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "electrocardiogramOnboardingHistoryType:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v16, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Completed onboarding for %@ (onboarding = %d) with country code %@.\n\nOnboarding history: %@"), v12, v11, v14, v18);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = CFSTR("Onboarding for ECG has not been completed.");
    }
  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    v7 = CFSTR("Results will repeat indefinitely when the ECG app has Demo Results enabled. Changes will sync to the active paired watch. Quit the ECG app to apply changes or restart result order.");
  }

  return v7;
}

- (id)displayableDescriptionFromValue:(id)a3
{
  id v3;
  id v4;
  __CFString *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  id v14;
  id v15;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      if ((objc_msgSend(v4, "isEqual:", &stru_24D38E7C8) & 1) != 0)
        v5 = CFSTR("(empty string)");
      else
        v5 = (__CFString *)v4;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v3, 0, 0, &v15);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v15;
        v8 = v7;
        if (!v6 || v7)
        {
          objc_msgSend(v7, "localizedDescription");
          v11 = objc_claimAutoreleasedReturnValue();
          v9 = (void *)v11;
          v12 = CFSTR("(error)");
          if (v11)
            v12 = (__CFString *)v11;
          v10 = v12;
        }
        else
        {
          v14 = 0;
          objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 0, &v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v14;
          v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
        }
        v5 = v10;

      }
      else
      {
        objc_msgSend(v3, "description");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v5 = CFSTR("(null)");
  }

  return v5;
}

- (void)keyboardDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForSelectedRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathForSelectedRow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v8, 1);

    -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endEditing:", 0);

  }
}

- (void)updateCellIndexNumberLabels
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "indexPathForCell:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = (void *)MEMORY[0x24BDD16F0];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "row") + 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedStringFromNumber:numberStyle:", v13, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setDisplayName:", v14);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)clearCellIndexNumberLabels
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "setDisplayName:", 0);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5;
  id v6;
  void *v7;
  int64_t v8;

  v5 = a3;
  -[WDElectrocardiogramInternalSettingsViewController resultPicker](self, "resultPicker");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[WDElectrocardiogramInternalSettingsViewController allDemoResults](self, "allDemoResults");
  else
    -[WDElectrocardiogramInternalSettingsViewController allAlgorithmVersions](self, "allAlgorithmVersions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  -[WDElectrocardiogramInternalSettingsViewController resultPicker](self, "resultPicker");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
    -[WDElectrocardiogramInternalSettingsViewController allDemoResults](self, "allDemoResults");
  else
    -[WDElectrocardiogramInternalSettingsViewController allAlgorithmVersions](self, "allAlgorithmVersions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v7 = a3;
  -[WDElectrocardiogramInternalSettingsViewController resultPicker](self, "resultPicker");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathForSelectedRow");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v10 = v25;
    if (v25)
    {
      v18 = objc_msgSend(v25, "section");
      v10 = v25;
      if (!v18)
      {
        -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "cellForRowAtIndexPath:", v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[WDElectrocardiogramInternalSettingsViewController allDemoResults](self, "allDemoResults");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", a4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setDisplayValue:", v21);

          -[WDElectrocardiogramInternalSettingsViewController demoResultKeys](self, "demoResultKeys");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v22, "mutableCopy");

          -[WDElectrocardiogramInternalSettingsViewController allDemoResults](self, "allDemoResults");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", a4);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:atIndexedSubscript:", v24, objc_msgSend(v25, "row"));

          -[WDElectrocardiogramInternalSettingsViewController setDemoResultKeys:](self, "setDemoResultKeys:", v15);
          goto LABEL_10;
        }
LABEL_11:

        v10 = v25;
      }
    }
  }
  else
  {
    v10 = v25;
    if (v25)
    {
      v11 = objc_msgSend(v25, "section");
      v10 = v25;
      if (v11 == 2)
      {
        -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cellForRowAtIndexPath:", v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[WDElectrocardiogramInternalSettingsViewController allAlgorithmVersions](self, "allAlgorithmVersions");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", a4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "detailTextLabel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setText:", v15);

          -[WDElectrocardiogramInternalSettingsViewController _saveOverrideAlgorithmVersionIfNeeded:](self, "_saveOverrideAlgorithmVersionIfNeeded:", a4);
          -[WDElectrocardiogramInternalSettingsViewController tableView](self, "tableView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "endEditing:", 0);

LABEL_10:
          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
  }

}

- (void)_presentAvailabilityInternalSettingsViewController
{
  WDRemoteFeatureAvailabilityInternalSettingsViewController *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D3A6338);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[WDRemoteFeatureAvailabilityInternalSettingsViewController initWithConditions:]([WDRemoteFeatureAvailabilityInternalSettingsViewController alloc], "initWithConditions:", v5);
  -[WDElectrocardiogramInternalSettingsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v3, 1);

}

- (void)_saveOverrideAlgorithmVersionIfNeeded:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  if (*MEMORY[0x24BDD4290] == a3)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", *MEMORY[0x24BDD2BC8]);
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x24BDD3B70], "onboardingVersionForKnownAlgorithmVersion:");
    objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x24BDD2BC8]);

  }
}

- (unint64_t)_overrideAlgorithmVersion
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDD2BC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(MEMORY[0x24BDD3B70], "algorithmVersionForOnboardingVersion:", objc_msgSend(v3, "integerValue"));
  return v4;
}

- (id)_onboardingCompletedAlgorithmVersion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;

  -[WDElectrocardiogramInternalSettingsViewController heartRhythmAvailability](self, "heartRhythmAvailability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "electrocardiogramOnboardingCompletedVersionNoCache");

  v4 = objc_msgSend(MEMORY[0x24BDD3B70], "algorithmVersionForOnboardingVersion:", v3);
  v5 = CFSTR("N/A");
  if (v4 == 2)
    v5 = CFSTR("ECG 2");
  if (v4 == 1)
    return CFSTR("ECG 1");
  else
    return (id)v5;
}

- (void)_startFullOnboarding
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  -[WDElectrocardiogramInternalSettingsViewController heartRhythmAvailability](self, "heartRhythmAvailability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Cannot Start Full Onboarding"), CFSTR("The ECG feature already has an onboarded completed! Please reset the current onboarding first or choose the upgrade flow."), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("Ok"), 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v5);

    -[WDElectrocardiogramInternalSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }
  else
  {
    -[WDElectrocardiogramInternalSettingsViewController _presentOnboardingManagerWithOnboardingType:](self, "_presentOnboardingManagerWithOnboardingType:", 0);
  }
}

- (void)_startUpgrade
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  -[WDElectrocardiogramInternalSettingsViewController heartRhythmAvailability](self, "heartRhythmAvailability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isElectrocardiogramOnboardingCompletedForAnyOnboardingVersion");

  if ((v4 & 1) != 0)
  {
    -[WDElectrocardiogramInternalSettingsViewController _presentOnboardingManagerWithOnboardingType:](self, "_presentOnboardingManagerWithOnboardingType:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Cannot Start Upgrade"), CFSTR("Cannot upgrade ECG without a full onboarding already completed before, as there is nothing to upgrade from! Please start a full onboarding instead."), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", CFSTR("Ok"), 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v5);

    -[WDElectrocardiogramInternalSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }
}

- (void)_presentOnboardingManagerWithOnboardingType:(int64_t)a3
{
  _BOOL8 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v5 = a3 != 1;
  v6 = objc_alloc(MEMORY[0x24BE4C0A0]);
  -[WDElectrocardiogramInternalSettingsViewController healthStore](self, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDElectrocardiogramInternalSettingsViewController dateCache](self, "dateCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = 1;
  v9 = (void *)objc_msgSend(v6, "initWithOnboardingType:isFirstTimeOnboarding:healthStore:dateCache:provenance:delegate:isSampleInteractive:", a3, v5, v7, v8, 0, self, v12);
  -[WDElectrocardiogramInternalSettingsViewController setOnboardingManager:](self, "setOnboardingManager:", v9);

  -[WDElectrocardiogramInternalSettingsViewController onboardingManager](self, "onboardingManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "onboardingNavigationController");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setModalInPresentation:", 1);
  -[WDElectrocardiogramInternalSettingsViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v13, 1, 0);

}

- (void)_resetOnboarding
{
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v5 = v12;
    _os_log_impl(&dword_215814000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting onboarding", buf, 0xCu);

  }
  v6 = objc_alloc(MEMORY[0x24BDD3BE0]);
  v7 = *MEMORY[0x24BDD2DE0];
  -[WDElectrocardiogramInternalSettingsViewController healthStore](self, "healthStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFeatureIdentifier:healthStore:", v7, v8);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__WDElectrocardiogramInternalSettingsViewController__resetOnboarding__block_invoke;
  v10[3] = &unk_24D38CFB0;
  v10[4] = self;
  objc_msgSend(v9, "resetOnboardingWithCompletion:", v10);

}

void __69__WDElectrocardiogramInternalSettingsViewController__resetOnboarding__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __69__WDElectrocardiogramInternalSettingsViewController__resetOnboarding__block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "heartRhythmAvailabilityDidUpdate");

}

- (void)didTapOnElectrocardiogram:(id)a3
{
  id v3;

  -[WDElectrocardiogramInternalSettingsViewController onboardingManager](self, "onboardingManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissOnboarding");

}

- (void)didCompleteOnboarding
{
  -[WDElectrocardiogramInternalSettingsViewController setOnboardingManager:](self, "setOnboardingManager:", 0);
}

- (void)didDismissOnboarding
{
  -[WDElectrocardiogramInternalSettingsViewController setOnboardingManager:](self, "setOnboardingManager:", 0);
}

- (void)heartRhythmAvailabilityDidUpdate
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__WDElectrocardiogramInternalSettingsViewController_heartRhythmAvailabilityDidUpdate__block_invoke;
  block[3] = &unk_24D38D000;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __85__WDElectrocardiogramInternalSettingsViewController_heartRhythmAvailabilityDidUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSections:withRowAnimation:", v3, 100);

  return objc_msgSend(*(id *)(a1 + 32), "reloadKeyValueDomainContent");
}

- (void)viewControllerWillEnterAdaptiveModal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  v4 = (void *)MEMORY[0x24BDF67B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __89__WDElectrocardiogramInternalSettingsViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_24D38D0A0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  -[WDElectrocardiogramInternalSettingsViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __89__WDElectrocardiogramInternalSettingsViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[WDElectrocardiogramInternalSettingsViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

- (NSArray)allAlgorithmVersions
{
  return self->_allAlgorithmVersions;
}

- (HKHostingAreaLayoutView)algorithmVersionPickerInputView
{
  return self->_algorithmVersionPickerInputView;
}

- (void)setAlgorithmVersionPickerInputView:(id)a3
{
  objc_storeStrong((id *)&self->_algorithmVersionPickerInputView, a3);
}

- (UIPickerView)algorithmVersionPicker
{
  return self->_algorithmVersionPicker;
}

- (void)setAlgorithmVersionPicker:(id)a3
{
  objc_storeStrong((id *)&self->_algorithmVersionPicker, a3);
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (NSArray)demoResultKeys
{
  return self->_demoResultKeys;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (HKHeartRhythmAvailability)heartRhythmAvailability
{
  return self->_heartRhythmAvailability;
}

- (HRElectrocardiogramOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (void)setOnboardingManager:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingManager, a3);
}

- (HKKeyValueDomain)keyValueDomain
{
  return self->_keyValueDomain;
}

- (NSArray)keyValueDomainContentKeys
{
  return self->_keyValueDomainContentKeys;
}

- (void)setKeyValueDomainContentKeys:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueDomainContentKeys, a3);
}

- (NSDictionary)keyValueDomainContent
{
  return self->_keyValueDomainContent;
}

- (void)setKeyValueDomainContent:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueDomainContent, a3);
}

- (BOOL)isDeletingSamples
{
  return self->_deletingSamples;
}

- (void)setDeletingSamples:(BOOL)a3
{
  self->_deletingSamples = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueDomainContent, 0);
  objc_storeStrong((id *)&self->_keyValueDomainContentKeys, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_heartRhythmAvailability, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_demoResultKeys, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_algorithmVersionPicker, 0);
  objc_storeStrong((id *)&self->_algorithmVersionPickerInputView, 0);
  objc_storeStrong((id *)&self->_allAlgorithmVersions, 0);
  objc_storeStrong((id *)&self->_resultPicker, 0);
  objc_storeStrong((id *)&self->_pickerInputView, 0);
  objc_storeStrong((id *)&self->_allDemoResults, 0);
}

void __69__WDElectrocardiogramInternalSettingsViewController__resetOnboarding__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_215814000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Error resetting ECG onboarding: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
