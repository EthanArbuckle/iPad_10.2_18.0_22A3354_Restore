@implementation HUAlarmEditSettingViewController

- (HUAlarmEditSettingViewController)initWithAlarm:(id)a3 setting:(int64_t)a4 mediaProfileContainer:(id)a5 selectedRoom:(id)a6 loggedInAppleMusicAccountDSID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HUAlarmEditSettingViewController *v16;
  uint64_t v17;
  NSString *loggedInAppleMusicAccountDSID;
  uint64_t v19;
  MTMutableAlarm *alarm;
  uint64_t v21;
  NSMutableArray *roomsList;
  objc_super v24;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HUAlarmEditSettingViewController;
  v16 = -[HUAlarmEditSettingViewController init](&v24, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v15, "copy");
    loggedInAppleMusicAccountDSID = v16->_loggedInAppleMusicAccountDSID;
    v16->_loggedInAppleMusicAccountDSID = (NSString *)v17;

    v16->_setting = a4;
    v19 = objc_msgSend(v12, "mutableCopy");
    alarm = v16->_alarm;
    v16->_alarm = (MTMutableAlarm *)v19;

    objc_storeStrong((id *)&v16->_selectedRoom, a6);
    v21 = objc_opt_new();
    roomsList = v16->_roomsList;
    v16->_roomsList = (NSMutableArray *)v21;

    if (v13 && v16->_setting == 3)
      -[HUAlarmEditSettingViewController _setupPlayInSettingWithMediaProfileContainer:](v16, "_setupPlayInSettingWithMediaProfileContainer:", v13);
    -[HUAlarmEditSettingViewController _commonInitialization](v16, "_commonInitialization");
  }

  return v16;
}

- (id)initPlayInSettingWithMediaProfileContainer:(id)a3 selectedRoom:(id)a4
{
  id v6;
  id v7;
  HUAlarmEditSettingViewController *v8;
  HUAlarmEditSettingViewController *v9;
  uint64_t v10;
  NSMutableArray *roomsList;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUAlarmEditSettingViewController;
  v8 = -[HUAlarmEditSettingViewController init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_setting = 3;
    objc_storeStrong((id *)&v8->_selectedRoom, a4);
    v10 = objc_opt_new();
    roomsList = v9->_roomsList;
    v9->_roomsList = (NSMutableArray *)v10;

    -[HUAlarmEditSettingViewController _setupPlayInSettingWithMediaProfileContainer:](v9, "_setupPlayInSettingWithMediaProfileContainer:", v6);
    -[HUAlarmEditSettingViewController _commonInitialization](v9, "_commonInitialization");
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HUAlarmEditSettingViewController;
  -[HUAlarmEditSettingViewController dealloc](&v4, sel_dealloc);
}

- (void)_commonInitialization
{
  int64_t setting;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  setting = self->_setting;
  switch(setting)
  {
    case 3:
      v4 = CFSTR("HUAlarmPlayInLabel");
      break;
    case 2:
      _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmEditLabel"), CFSTR("HUAlarmEditLabel"), 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0CEB978], 0);
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x1E0CEB970], 0);

      v5 = (uint64_t)v7;
      goto LABEL_9;
    case 1:
      v4 = CFSTR("HUAlarmEditRepeat");
      break;
    default:
      v5 = 0;
      goto LABEL_9;
  }
  _HULocalizedStringWithDefaultValue(v4, v4, 1);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v8 = (id)v5;
  -[HUAlarmEditSettingViewController setTitle:](self, "setTitle:", v5);

}

- (void)loadView
{
  int64_t setting;
  void *v4;
  id v5;
  UITableView *v6;
  objc_class *v7;
  void *v8;
  id v9;
  UITableView *tableView;
  id v11;

  v11 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v11, "setAutoresizingMask:", 18);
  setting = self->_setting;
  if ((unint64_t)(setting - 1) <= 2)
  {
    if (setting == 3)
    {
      v7 = (objc_class *)MEMORY[0x1E0CEAA58];
    }
    else
    {
      if (setting == 1)
      {
        -[HUAlarmEditSettingViewController alarm](self, "alarm");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        self->_repeatSchedule = objc_msgSend(v4, "repeatSchedule");

        v5 = objc_alloc(MEMORY[0x1E0CEAA58]);
        v6 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
LABEL_8:
        tableView = self->_tableView;
        self->_tableView = v6;

        -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kHUAlarmEditSettingViewControllerTableViewCellIdentifier"));
        -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
        -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
        -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
        objc_msgSend(v11, "addSubview:", self->_tableView);
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__dismiss, kHUEditAlarmTitleFinishedNotification, 0);

      v7 = (objc_class *)HUCenteredCellUITableView;
    }
    v9 = [v7 alloc];
    v6 = (UITableView *)objc_msgSend(v9, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    goto LABEL_8;
  }
LABEL_9:
  -[HUAlarmEditSettingViewController setView:](self, "setView:", v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  int64_t setting;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)HUAlarmEditSettingViewController;
  -[HUAlarmEditSettingViewController viewWillAppear:](&v20, sel_viewWillAppear_, a3);
  setting = self->_setting;
  if (setting == 1)
  {
    v17 = objc_alloc(MEMORY[0x1E0C99D48]);
    v18 = (void *)objc_msgSend(v17, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLocale:", v19);

    self->_firstWeekday = objc_msgSend(v18, "firstWeekday");
  }
  else if (setting == 2)
  {
    -[HUAlarmEditSettingViewController editingCell](self, "editingCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      -[HUAlarmEditSettingViewController setEditingCell:](self, "setEditingCell:", v6);

      -[HUAlarmEditSettingViewController alarm](self, "alarm");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAlarmEditSettingViewController editingCell](self, "editingCell");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textField");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v8);

      -[HUAlarmEditSettingViewController editingCell](self, "editingCell");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAutocapitalizationType:", 2);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0CEBD20];
      -[HUAlarmEditableTextCell textField](self->_editingCell, "textField");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_textValueChanged_, v14, v15);

    }
    if ((HUIsPadIdiom() & 1) == 0 && (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config") & 1) == 0)
    {
      -[HUAlarmEditableTextCell textField](self->_editingCell, "textField");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "becomeFirstResponder");

    }
    if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
      -[HUAlarmEditableTextCell setEnabled:](self->_editingCell, "setEnabled:", 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUAlarmEditSettingViewController;
  -[HUAlarmEditSettingViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (self->_setting == 2
    && HUIsPadIdiom()
    && (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config") & 1) == 0)
  {
    -[HUAlarmEditableTextCell textField](self->_editingCell, "textField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
}

- (void)viewDidUnload
{
  UITableView *tableView;
  objc_super v4;

  tableView = self->_tableView;
  self->_tableView = 0;

  v4.receiver = self;
  v4.super_class = (Class)HUAlarmEditSettingViewController;
  -[HUAlarmEditSettingViewController viewDidUnload](&v4, sel_viewDidUnload);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUAlarmEditSettingViewController;
  -[HUAlarmEditSettingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  if ((HUIsPadIdiom() & 1) == 0 && (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config") & 1) == 0)
  {
    -[HUAlarmEditableTextCell textField](self->_editingCell, "textField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeFirstResponder");

  }
}

- (void)_dismiss
{
  id v2;
  id v3;

  -[HUAlarmEditSettingViewController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "popViewControllerAnimated:", 1);

}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  if (!HUIsPadIdiom()
    || (-[HUAlarmEditSettingViewController traitCollection](self, "traitCollection"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "horizontalSizeClass"),
        v4,
        v5 != 2))
  {
    objc_msgSend(v16, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CEB890]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[UITableView setKeyboardFrame:](self->_tableView, "setKeyboardFrame:", v9, v11, v13, v15);
    -[UITableView layoutSubviews](self->_tableView, "layoutSubviews");

  }
}

- (void)_keyboardWillHide:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  int v25;
  _QWORD v26[9];

  v4 = a3;
  if (!HUIsPadIdiom()
    || (-[HUAlarmEditSettingViewController traitCollection](self, "traitCollection"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "horizontalSizeClass"),
        v5,
        v6 != 2))
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CEB888]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CGRectValue");
    v10 = v9;

    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CEB890]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "CGRectValue");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    if (vabdd_f64(v15, v10) >= 1.0)
    {
      v20 = (void *)MEMORY[0x1E0CEABB0];
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CEB7F0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "floatValue");
      v23 = v22;
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CEB7E8]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "intValue");
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __54__HUAlarmEditSettingViewController__keyboardWillHide___block_invoke;
      v26[3] = &unk_1E6F58208;
      v26[4] = self;
      v26[5] = v13;
      *(double *)&v26[6] = v15;
      v26[7] = v17;
      v26[8] = v19;
      objc_msgSend(v20, "animateWithDuration:delay:options:animations:completion:", v25, v26, 0, v23, 0.0);

    }
  }

}

void __54__HUAlarmEditSettingViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyboardFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutSubviews");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t setting;
  void *v5;
  int64_t v6;

  setting = self->_setting;
  if (setting == 1)
    return 7;
  if (setting != 3)
    return 1;
  -[HUAlarmEditSettingViewController roomsList](self, "roomsList", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (unsigned)maskForRow:(int64_t)a3
{
  return 1 << ((a3 + self->_firstWeekday + 5) % 7);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t setting;
  unsigned int v10;
  HUAlarmEditableTextCell *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  uint64_t v26;
  void *v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  setting = self->_setting;
  if (setting == 3)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("kHUAlarmEditSettingViewControllerTableViewCellIdentifier"));
    v11 = (HUAlarmEditableTextCell *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditSettingViewController roomsList](self, "roomsList");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditableTextCell textLabel](v11, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    -[HUAlarmEditSettingViewController selectedRoom](self, "selectedRoom");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[HUAlarmEditSettingViewController roomsList](self, "roomsList");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "uniqueIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAlarmEditSettingViewController selectedRoom](self, "selectedRoom");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "uniqueIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "hmf_isEqualToUUID:", v25))
        v26 = 3;
      else
        v26 = 0;

    }
    else
    {
      v26 = 0;
    }

    -[HUAlarmEditableTextCell setAccessoryType:](v11, "setAccessoryType:", v26);
  }
  else if (setting == 1)
  {
    v10 = -[HUAlarmEditSettingViewController maskForRow:](self, "maskForRow:", objc_msgSend(v7, "row"));
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("kHUAlarmEditSettingViewControllerTableViewCellIdentifier"));
    v11 = (HUAlarmEditableTextCell *)objc_claimAutoreleasedReturnValue();
    DateMaskToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditableTextCell textLabel](v11, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    -[HUAlarmEditSettingViewController alarm](self, "alarm");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "repeatSchedule") & v10) != 0)
      v15 = 3;
    else
      v15 = 0;
    -[HUAlarmEditableTextCell setAccessoryType:](v11, "setAccessoryType:", v15);

  }
  else
  {
    v11 = self->_editingCell;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "hu_alarmsPrimaryTextColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmEditableTextCell textLabel](v11, "textLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTextColor:", v27);

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  int64_t setting;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  if (v6)
  {
    setting = self->_setting;
    if (setting == 3)
    {
      objc_msgSend(v24, "deselectRowAtIndexPath:animated:", v6, 1);
      -[HUAlarmEditSettingViewController selectedRoom](self, "selectedRoom");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[HUAlarmEditSettingViewController roomsList](self, "roomsList");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUAlarmEditSettingViewController selectedRoom](self, "selectedRoom");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "indexOfObject:", v14);

        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v15, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "cellForRowAtIndexPath:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "setAccessoryType:", 0);
        }
      }
      objc_msgSend(v24, "cellForRowAtIndexPath:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessoryType:", 3);
      -[HUAlarmEditSettingViewController roomsList](self, "roomsList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAlarmEditSettingViewController setSelectedRoom:](self, "setSelectedRoom:", v19);

      goto LABEL_15;
    }
    if (setting == 1)
    {
      objc_msgSend(v24, "cellForRowAtIndexPath:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "accessoryType") == 3)
        v9 = 0;
      else
        v9 = 3;
      objc_msgSend(v8, "setAccessoryType:", v9);
      objc_msgSend(v24, "deselectRowAtIndexPath:animated:", v6, 1);
      v10 = -[HUAlarmEditSettingViewController maskForRow:](self, "maskForRow:", objc_msgSend(v6, "row"));
      if (objc_msgSend(v8, "accessoryType") == 3)
        v11 = -[HUAlarmEditSettingViewController repeatSchedule](self, "repeatSchedule") | v10;
      else
        v11 = -[HUAlarmEditSettingViewController repeatSchedule](self, "repeatSchedule") & ~v10;
      -[HUAlarmEditSettingViewController setRepeatSchedule:](self, "setRepeatSchedule:", v11);
      v20 = -[HUAlarmEditSettingViewController repeatSchedule](self, "repeatSchedule");
      -[HUAlarmEditSettingViewController alarm](self, "alarm");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setRepeatSchedule:", v20);

LABEL_15:
      -[HUAlarmEditSettingViewController delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAlarmEditSettingViewController alarm](self, "alarm");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "alarmEditSettingController:didEditAlarm:", self, v23);

    }
  }

}

- (void)textValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "object");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  if (v7)
  {
    objc_msgSend(v12, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[HUAlarmEditSettingViewController alarm](self, "alarm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v8);

  if (v7)
  -[HUAlarmEditSettingViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmEditSettingViewController alarm](self, "alarm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alarmEditSettingController:didEditAlarm:", self, v11);

}

- (HUAlarmEditSettingViewControllerDelegate)delegate
{
  return (HUAlarmEditSettingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)loggedInAppleMusicAccountDSID
{
  return self->_loggedInAppleMusicAccountDSID;
}

- (HMRoom)selectedRoom
{
  return self->_selectedRoom;
}

- (void)setSelectedRoom:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRoom, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (HUAlarmEditableTextCell)editingCell
{
  return self->_editingCell;
}

- (void)setEditingCell:(id)a3
{
  objc_storeStrong((id *)&self->_editingCell, a3);
}

- (int64_t)setting
{
  return self->_setting;
}

- (void)setSetting:(int64_t)a3
{
  self->_setting = a3;
}

- (unint64_t)firstWeekday
{
  return self->_firstWeekday;
}

- (void)setFirstWeekday:(unint64_t)a3
{
  self->_firstWeekday = a3;
}

- (unint64_t)repeatSchedule
{
  return self->_repeatSchedule;
}

- (void)setRepeatSchedule:(unint64_t)a3
{
  self->_repeatSchedule = a3;
}

- (NSMutableArray)roomsList
{
  return self->_roomsList;
}

- (void)setRoomsList:(id)a3
{
  objc_storeStrong((id *)&self->_roomsList, a3);
}

- (MTMutableAlarm)alarm
{
  return self->_alarm;
}

- (void)setAlarm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarm, 0);
  objc_storeStrong((id *)&self->_roomsList, 0);
  objc_storeStrong((id *)&self->_editingCell, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_selectedRoom, 0);
  objc_storeStrong((id *)&self->_loggedInAppleMusicAccountDSID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
