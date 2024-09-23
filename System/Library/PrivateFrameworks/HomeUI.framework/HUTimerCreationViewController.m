@implementation HUTimerCreationViewController

- (HUTimerCreationViewController)initWithMediaProfileContainer:(id)a3
{
  id v5;
  HUTimerCreationViewController *v6;
  HUTimerCreationViewController *v7;
  uint64_t v8;
  HMRoom *selectedRoom;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTimerCreationViewController;
  v6 = -[HUTimerCreationViewController initWithStyle:](&v11, sel_initWithStyle_, 2);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaProfileContainer, a3);
    objc_msgSend(v5, "hf_parentRoom");
    v8 = objc_claimAutoreleasedReturnValue();
    selectedRoom = v7->_selectedRoom;
    v7->_selectedRoom = (HMRoom *)v8;

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  HUTimerIntervalPickerView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  HUTimerIntervalPickerView *v9;
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
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)HUTimerCreationViewController;
  -[HUTimerCreationViewController viewDidLoad](&v27, sel_viewDidLoad);
  -[HUTimerCreationViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HUTimerContainerCellIdentifier"));

  v4 = [HUTimerIntervalPickerView alloc];
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[HUTimerIntervalPickerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
  -[HUTimerCreationViewController setTimePickerView:](self, "setTimePickerView:", v9);

  -[HUTimerCreationViewController timePickerView](self, "timePickerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[HUTimerCreationViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAAD0]), "initWithFrame:", v5, v6, v7, v8);
  -[HUTimerCreationViewController setNameField:](self, "setNameField:", v11);

  _HULocalizedStringWithDefaultValue(CFSTR("HUTimerLabelPlaceholder"), CFSTR("HUTimerLabelPlaceholder"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerCreationViewController nameField](self, "nameField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPlaceholder:", v12);

  -[HUTimerCreationViewController nameField](self, "nameField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutocapitalizationType:", 1);

  -[HUTimerCreationViewController nameField](self, "nameField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClearButtonMode:", 1);

  -[HUTimerCreationViewController nameField](self, "nameField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  _HULocalizedStringWithDefaultValue(CFSTR("HUNewTimer"), CFSTR("HUNewTimer"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerCreationViewController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:", v17);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelTimerCreation_);
  -[HUTimerCreationViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLeftBarButtonItem:", v19);

  v21 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUStartTimer"), CFSTR("HUStartTimer"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithTitle:style:target:action:", v22, 2, self, sel_createTimer_);
  -[HUTimerCreationViewController navigationItem](self, "navigationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRightBarButtonItem:", v23);

  -[HUTimerCreationViewController navigationItem](self, "navigationItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rightBarButtonItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setEnabled:", 0);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 != 2)
    return &stru_1E6F60E80;
  _HULocalizedStringWithDefaultValue(CFSTR("HUTimerToneHeaderLabel"), CFSTR("HUTimerToneHeaderLabel"), 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
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
  id v17;
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
  void *v28;
  uint64_t v30;
  uint64_t v31;
  id (*v32)(uint64_t);
  void *v33;
  HUTimerCreationViewController *v34;
  id v35;
  _QWORD v36[5];
  id v37;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HUTimerContainerCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "section"))
  {
    objc_msgSend(v7, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerCreationViewController nameField](self, "nameField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v14);

    -[HUTimerCreationViewController nameField](self, "nameField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v16 = (void *)MEMORY[0x1E0CB3718];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __65__HUTimerCreationViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v36[3] = &unk_1E6F59D18;
    v36[4] = self;
    v17 = v7;
    v37 = v17;
    __65__HUTimerCreationViewController_tableView_cellForRowAtIndexPath___block_invoke((uint64_t)v36);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v18);

    if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
    {
      -[HUTimerCreationViewController nameField](self, "nameField");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setEnabled:", 0);

      -[HUTimerCreationViewController nameField](self, "nameField");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setUserInteractionEnabled:", 0);

      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTimerCreationViewController nameField](self, "nameField");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTextColor:", v21);

      objc_msgSend(v17, "setSelectionStyle:", 0);
    }
    v23 = v37;
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "section") != 1)
    goto LABEL_11;
  if (!objc_msgSend(v6, "row"))
  {
    objc_msgSend(v7, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerCreationViewController timePickerView](self, "timePickerView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v25);

    -[HUTimerCreationViewController timePickerView](self, "timePickerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v27 = (void *)MEMORY[0x1E0CB3718];
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __65__HUTimerCreationViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    v33 = &unk_1E6F59D18;
    v34 = self;
    v35 = v7;
    __65__HUTimerCreationViewController_tableView_cellForRowAtIndexPath___block_invoke_2((uint64_t)&v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v28, v30, v31, v32, v33, v34);

    v23 = v35;
LABEL_10:

    goto LABEL_11;
  }
  if (objc_msgSend(v6, "row") == 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmPlayInLabel"), CFSTR("HUAlarmPlayInLabel"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[HUTimerCreationViewController selectedRoom](self, "selectedRoom");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    objc_msgSend(v7, "setAccessoryType:", 1);
  }
LABEL_11:

  return v7;
}

id __65__HUTimerCreationViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "nameField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "nameField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v12);

  objc_msgSend(*(id *)(a1 + 32), "nameField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v17);

  objc_msgSend(*(id *)(a1 + 32), "nameField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v22);

  return v2;
}

id __65__HUTimerCreationViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "timePickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "timePickerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v12);

  objc_msgSend(*(id *)(a1 + 32), "timePickerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v17);

  objc_msgSend(*(id *)(a1 + 32), "timePickerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v22);

  return v2;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;
  void *v7;
  double v8;

  v5 = a4;
  if (objc_msgSend(v5, "section") == 1)
  {
    if (objc_msgSend(v5, "row"))
    {
      v6 = *MEMORY[0x1E0CEBC10];
    }
    else
    {
      -[HUTimerCreationViewController timePickerView](self, "timePickerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      v6 = v8;

    }
  }
  else
  {
    v6 = 44.0;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  HUAlarmEditSettingViewController *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "section") == 1 && objc_msgSend(v10, "row") == 1)
  {
    v5 = [HUAlarmEditSettingViewController alloc];
    -[HUTimerCreationViewController mediaProfileContainer](self, "mediaProfileContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerCreationViewController selectedRoom](self, "selectedRoom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HUAlarmEditSettingViewController initPlayInSettingWithMediaProfileContainer:selectedRoom:](v5, "initPlayInSettingWithMediaProfileContainer:selectedRoom:", v6, v7);

    objc_msgSend(v8, "setDelegate:", self);
    -[HUTimerCreationViewController preferredContentSize](self, "preferredContentSize");
    objc_msgSend(v8, "setPreferredContentSize:");
    -[HUTimerCreationViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v8, 1);

  }
}

- (void)textFieldDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerCreationViewController setTimerTitle:](self, "setTimerTitle:", v4);

}

- (BOOL)textFieldShouldClear:(id)a3
{
  -[HUTimerCreationViewController setTimerTitle:](self, "setTimerTitle:", 0);
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerCreationViewController setTimerTitle:](self, "setTimerTitle:", v5);

  objc_msgSend(v4, "resignFirstResponder");
  return 1;
}

- (void)pickerView:(id)a3 didChangeSelectedDuration:(double)a4
{
  void *v6;
  id v7;

  -[HUTimerCreationViewController setTimerDuration:](self, "setTimerDuration:", a3);
  -[HUTimerCreationViewController navigationItem](self, "navigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", a4 > 0.0);

}

- (void)cancelTimerCreation:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  HUTimerCreationViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[HUTimerCreationViewController cancelTimerCreation:]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%s(%@): Cancelling timer creation", (uint8_t *)&v5, 0x16u);
  }

  -[HUTimerCreationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)alarmEditSettingController:(id)a3 didEditAlarm:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "selectedRoom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerCreationViewController setSelectedRoom:](self, "setSelectedRoom:", v5);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTimerCreationViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadRowsAtIndexPaths:withRowAnimation:", v8, 5);

}

- (void)createTimer:(id)a3
{
  NSObject *v4;
  double v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  HUTimerCreationViewController *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315394;
    v22 = "-[HUTimerCreationViewController createTimer:]";
    v23 = 2112;
    v24 = self;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%s(%@) done", (uint8_t *)&v21, 0x16u);
  }

  -[HUTimerCreationViewController timerDuration](self, "timerDuration");
  if (v5 > 0.0)
  {
    -[HUTimerCreationViewController nameField](self, "nameField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEditing");

    if (v7)
    {
      -[HUTimerCreationViewController nameField](self, "nameField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTimerCreationViewController setTimerTitle:](self, "setTimerTitle:", v9);

      -[HUTimerCreationViewController nameField](self, "nameField");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "endEditing:", 1);

    }
    v11 = objc_alloc(MEMORY[0x1E0D4FA70]);
    -[HUTimerCreationViewController timerDuration](self, "timerDuration");
    v12 = (void *)objc_msgSend(v11, "initWithState:duration:", 3);
    -[HUTimerCreationViewController timerTitle](self, "timerTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v13);

    objc_msgSend(MEMORY[0x1E0D4FA78], "toneSoundWithIdentifier:vibrationIdentifer:volume:", 0, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSound:", v14);

    -[HUTimerCreationViewController selectedRoom](self, "selectedRoom");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTimerCreationViewController mediaProfileContainer](self, "mediaProfileContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hf_moveToRoom:withMediaProfileContainer:", v15, v16);

    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315650;
      v22 = "-[HUTimerCreationViewController createTimer:]";
      v23 = 2112;
      v24 = self;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%s(%@): Creating timer %@", (uint8_t *)&v21, 0x20u);
    }

    -[HUTimerCreationViewController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[HUTimerCreationViewController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timerCreationViewController:didCreateTimer:", self, v12);

    }
    -[HUTimerCreationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (HUTimerCreationDelegate)delegate
{
  return (HUTimerCreationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void)setMediaProfileContainer:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, a3);
}

- (HUTimerIntervalPickerView)timePickerView
{
  return self->_timePickerView;
}

- (void)setTimePickerView:(id)a3
{
  objc_storeStrong((id *)&self->_timePickerView, a3);
}

- (UITextField)nameField
{
  return self->_nameField;
}

- (void)setNameField:(id)a3
{
  objc_storeStrong((id *)&self->_nameField, a3);
}

- (NSString)timerTitle
{
  return self->_timerTitle;
}

- (void)setTimerTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (double)timerDuration
{
  return self->_timerDuration;
}

- (void)setTimerDuration:(double)a3
{
  self->_timerDuration = a3;
}

- (HMRoom)selectedRoom
{
  return self->_selectedRoom;
}

- (void)setSelectedRoom:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRoom, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedRoom, 0);
  objc_storeStrong((id *)&self->_timerTitle, 0);
  objc_storeStrong((id *)&self->_nameField, 0);
  objc_storeStrong((id *)&self->_timePickerView, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
