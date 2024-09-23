@implementation HUAlarmEditViewController

+ (CGSize)desiredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 320.0;
  v3 = 509.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (HUAlarmEditViewController)initWithMediaProfileContainer:(id)a3 alarm:(id)a4
{
  id v7;
  id v8;
  HUAlarmEditViewController *v9;
  HUAlarmEditViewController *v10;
  void *v11;
  uint64_t v12;
  MTMutableAlarm *editedAlarm;
  void *v14;
  uint64_t v15;
  MTMutableAlarm *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v41;
  uint64_t v43;
  void *v44;
  objc_super v45;

  v7 = a3;
  v8 = a4;
  v45.receiver = self;
  v45.super_class = (Class)HUAlarmEditViewController;
  v9 = -[HUAlarmEditViewController init](&v45, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaProfileContainer, a3);
    v10->_accessorySupportsMusicAlarm = -[HUAlarmEditViewController _isMusicAlarmSupportedInAccessory](v10, "_isMusicAlarmSupportedInAccessory");
    v10->_isCustomVolumeSelected = 0;
    v10->_isDatePickerWheelScrolled = 0;
    objc_storeStrong((id *)&v10->_originalAlarm, a4);
    objc_msgSend(v7, "hf_parentRoom");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v10->_selectedRoom, v11);
    if (v8)
    {
      v12 = objc_msgSend(v8, "mutableCopy");
      editedAlarm = v10->_editedAlarm;
      v10->_editedAlarm = (MTMutableAlarm *)v12;

      _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmEdit"), CFSTR("HUAlarmEdit"), 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](v10, "accessorySupportsMusicAlarm")
        && v10->_editedAlarm)
      {
        -[HUAlarmEditViewController _checkAndPrepareEditingAlarmForMediaTypeAlarm](v10, "_checkAndPrepareEditingAlarmForMediaTypeAlarm");
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4FA60], "alarm");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v10->_editedAlarm;
      v10->_editedAlarm = (MTMutableAlarm *)v15;

      _HULocalizedStringWithDefaultValue(CFSTR("HUCreateNewAlarm"), CFSTR("HUCreateNewAlarm"), 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAlarmEditViewController mediaProfileContainer](v10, "mediaProfileContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mediaProfiles");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUMediaAccountUtilities defaultCurrentVolumeForMediaProfiles:](HUMediaAccountUtilities, "defaultCurrentVolumeForMediaProfiles:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      -[HUAlarmEditViewController setSelectedCustomVolumeLevel:](v10, "setSelectedCustomVolumeLevel:", v20);

    }
    if (_os_feature_enabled_impl())
    {
      -[MTMutableAlarm siriContext](v10->_editedAlarm, "siriContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x1E0D14888];
      objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0D14888]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        v44 = v11;
        if (v21)
          v24 = (id)objc_msgSend(v21, "mutableCopy");
        else
          v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v25 = v24;
        objc_msgSend(v7, "accessories", 1024);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "anyObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        COAlarmSiriContextTargetReferenceForAccessory();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v28, v22);

        objc_msgSend(*(id *)((char *)&v10->super.super.super.isa + v43), "setSiriContext:", v25);
        v11 = v44;
      }

    }
    v10->_editingAlarmSetting = -1;
    -[HUAlarmEditViewController setTitle:](v10, "setTitle:", v14);
    _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmBack"), CFSTR("HUAlarmBack"), 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditViewController navigationItem](v10, "navigationItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackButtonTitle:", v29);

    -[HUAlarmEditViewController setEdgesForExtendedLayout:](v10, "setEdgesForExtendedLayout:", 0);
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, v10, sel__cancelButtonClicked_);
    -[HUAlarmEditViewController navigationItem](v10, "navigationItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setLeftBarButtonItem:", v31);

    LODWORD(v31) = -[HUAlarmEditViewController accessorySupportsMusicAlarm](v10, "accessorySupportsMusicAlarm");
    v33 = objc_alloc(MEMORY[0x1E0CEA380]);
    if ((_DWORD)v31)
    {
      v34 = (void *)objc_msgSend(v33, "initWithBarButtonSystemItem:target:action:", 0, v10, sel__doneButtonClicked_);
      -[HUAlarmEditViewController navigationItem](v10, "navigationItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setRightBarButtonItem:", v34);

      if (-[HUAlarmEditViewController _isNewAlarm](v10, "_isNewAlarm")
        || !-[HUAlarmEditViewController _isAlarmTypeMedia](v10, "_isAlarmTypeMedia"))
      {
        v36 = -[HUAlarmEditViewController _hasUserSelectedToneAlarm](v10, "_hasUserSelectedToneAlarm");
      }
      else
      {
        v36 = -[HUAlarmEditViewController _isAlarmTypeMedia](v10, "_isAlarmTypeMedia");
      }
      -[HUAlarmEditViewController _updateEnableStateForDoneButton:](v10, "_updateEnableStateForDoneButton:", v36);
    }
    else
    {
      v37 = (void *)objc_msgSend(v33, "initWithBarButtonSystemItem:target:action:", 3, v10, sel__doneButtonClicked_);
      -[HUAlarmEditViewController navigationItem](v10, "navigationItem");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setRightBarButtonItem:", v37);

    }
    if ((HUIsPhoneIdiom() & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "desiredContentSize");
      -[HUAlarmEditViewController setPreferredContentSize:](v10, "setPreferredContentSize:");
    }
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v10, sel__didTap_);
    tapGestureRecognizer = v10->_tapGestureRecognizer;
    v10->_tapGestureRecognizer = (UITapGestureRecognizer *)v39;

    -[HUAlarmEditViewController view](v10, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addGestureRecognizer:", v10->_tapGestureRecognizer);

    -[UITapGestureRecognizer setDelegate:](v10->_tapGestureRecognizer, "setDelegate:", v10);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NSURLSessionDataTask cancel](self->_artworkFetchTask, "cancel");
  -[HUAlarmEditView timePicker](self->_editAlarmView, "timePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, sel__handlePickerChanged, 4096);

  v4.receiver = self;
  v4.super_class = (Class)HUAlarmEditViewController;
  -[HUAlarmEditViewController dealloc](&v4, sel_dealloc);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  void *v7;
  char v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUAlarmEditViewController;
  -[HUAlarmEditViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v9, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, a4);
  -[HUAlarmEditViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "horizontalSizeClass") == 1
    && objc_msgSend(v6, "horizontalSizeClass") == 2
    && objc_msgSend(v6, "verticalSizeClass") == 2)
  {
    v8 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");

    if ((v8 & 1) == 0)
      -[HUAlarmEditViewController saveAlarmOnlyIfEdited:](self, "saveAlarmOnlyIfEdited:", 1);
  }
  else
  {

  }
}

- (void)_didTap:(id)a3
{
  id v3;

  -[HUAlarmEditViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  id v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v13 = 1;
      goto LABEL_6;
    }
  }
  -[HUAlarmEditViewController tapGestureRecognizer](self, "tapGestureRecognizer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v12 != v6;

LABEL_6:
  return v13;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[HUAlarmEditViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3;

  -[HUAlarmEditViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

}

- (unint64_t)supportedInterfaceOrientations
{
  if (HUIsVeryWidePhoneSize())
    return 30;
  if (HUIsPadIdiom())
    return 30;
  return 2;
}

- (void)loadView
{
  HUAlarmEditView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  HUAlarmEditView *v9;
  HUAlarmEditView *editAlarmView;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v3 = [HUAlarmEditView alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v9 = -[HUAlarmEditView initWithFrame:supportsMusicAlarm:](v3, "initWithFrame:supportsMusicAlarm:", -[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"), v5, v6, v7, v8);
  editAlarmView = self->_editAlarmView;
  self->_editAlarmView = v9;

  -[HUAlarmEditView setAutoresizingMask:](self->_editAlarmView, "setAutoresizingMask:", 16);
  -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDataSource:", self);

  -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  v13 = *MEMORY[0x1E0CEBC10];
  -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRowHeight:", v13);

  -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HUAlarmEditViewControllerTableViewCellIdentifier"));

  -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setDisplaysCellContentStringsOnTapAndHold:", 1);

  if (HUIsPadIdiom())
    -[HUAlarmEditView setAutoresizingMask:](self->_editAlarmView, "setAutoresizingMask:", 18);
  -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0CEABB0]);
  v19 = (void *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v17, "setTableFooterView:", v19);

  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HUSnoozeSwitchCellReuseIdentifier"));

    -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HUVolumeSliderCellReuseIdentifier"));

    -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HUChooseMediahCellReuseIdentifier"));

    -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HURepeatMusicSwitchCellReuseIdentifier"));

    -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HUShuffleMusicSwitchCellReuseIdentifier"));

    -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_class();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "registerClass:forCellReuseIdentifier:", v26, v28);

    -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HUPlayToneCellIdentifier"));

    -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HUPlayMediaCellIdentifier"));

    -[HUAlarmEditViewController _updateAppleMusicSubscriptionStatus](self, "_updateAppleMusicSubscriptionStatus");
  }
  else
  {
    v31 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setHour:", objc_msgSend(v32, "hour"));

    -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setMinute:", objc_msgSend(v33, "minute"));

    -[HUAlarmEditView timePicker](self->_editAlarmView, "timePicker");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditView timePicker](self->_editAlarmView, "timePicker");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "calendar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dateFromComponents:", v31);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDate:", v37);

    -[HUAlarmEditView timePicker](self->_editAlarmView, "timePicker");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addTarget:action:forControlEvents:", self, sel__handlePickerChanged, 4096);

  }
  -[HUAlarmEditViewController setView:](self, "setView:", self->_editAlarmView);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUAlarmEditViewController;
  -[HUAlarmEditViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  self->_editingAlarmSetting = -1;
  -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[HUAlarmEditViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alarmEditControllerGettingDismissed:", self);

  v6.receiver = self;
  v6.super_class = (Class)HUAlarmEditViewController;
  -[HUAlarmEditViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewDidUnload
{
  HUAlarmEditView *editAlarmView;
  objc_super v4;

  editAlarmView = self->_editAlarmView;
  self->_editAlarmView = 0;

  v4.receiver = self;
  v4.super_class = (Class)HUAlarmEditViewController;
  -[HUAlarmEditViewController viewDidUnload](&v4, sel_viewDidUnload);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  _BOOL4 v4;
  BOOL v5;
  BOOL v6;
  char v8;
  int v9;
  BOOL v10;
  int64_t v11;
  _BOOL4 v12;

  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm", a3))
  {
    v4 = -[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm");
    v5 = -[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia");
    if (v4)
    {
      v6 = -[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm");
      if (v5)
      {
        if (v6)
          return 6;
        if (-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
        {
          if (!-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
            goto LABEL_27;
          return 6;
        }
        return 3;
      }
      if (!v6)
      {
        if (!-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
        {
LABEL_27:
          v9 = -[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume");
LABEL_28:
          v10 = v9 == 0;
          v11 = 4;
          goto LABEL_30;
        }
        return 0;
      }
    }
    else
    {
      v8 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
      if (v5)
      {
        if ((v8 & 1) == 0)
        {
          if ((HUIsPadIdiom() & 1) == 0)
          {
            v10 = !-[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume");
            v11 = 6;
LABEL_30:
            if (v10)
              return v11;
            else
              return v11 + 1;
          }
          return 6;
        }
        return 3;
      }
      if ((v8 & 1) == 0
        && (!HUIsPadIdiom()
         || !-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm")))
      {
        if (-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm")
          || -[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm"))
        {
          return 3;
        }
        if (!-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
        {
          v12 = -[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume");
          v9 = HUIsPhoneIdiom();
          if (!v12)
            goto LABEL_28;
          if (!v9 || -[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm"))
            return 5;
          return 6;
        }
        return 0;
      }
    }
    return 2;
  }
  if ((HUIsPadIdiom() & 1) != 0)
    return 1;
  if (-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm"))
    return 1;
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm", a3))
  {
    result = 3;
    switch(a4)
    {
      case 0:
        return result;
      case 1:
        goto LABEL_3;
      case 2:
        if (-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm")
          && !-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm"))
        {
          if (!-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
            goto LABEL_38;
          if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
            result = 0;
          else
            result = 2;
        }
        else
        {
          if (-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm")
            || -[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm"))
          {
            if (!-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm")
              && -[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm"))
            {
              return HUIsPhoneIdiom();
            }
            goto LABEL_32;
          }
          if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0)
            goto LABEL_38;
          if (-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
            result = 2;
          else
            result = 1;
        }
        break;
      case 3:
        if (-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm")
          || !-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm")
          && (!-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia")
           || -[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm"))
          && (-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia")
           || -[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm")))
        {
          goto LABEL_32;
        }
        goto LABEL_3;
      case 4:
        if (!-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm")
          && -[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
        {
LABEL_3:
          result = 2;
        }
        else if ((-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm")
                || !-[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume"))
               && (-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm")
                || -[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm")))
        {
LABEL_32:
          result = 0;
        }
        else
        {
LABEL_38:
          result = 1;
        }
        break;
      case 5:
        if ((-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm")
           || !-[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume"))
          && (-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm") || (HUIsPhoneIdiom() & 1) == 0))
        {
          goto LABEL_32;
        }
        goto LABEL_38;
      case 6:
        return HUIsPhoneIdiom();
      default:
        goto LABEL_32;
    }
  }
  else if (a4)
  {
    return 1;
  }
  else
  {
    return 2;
  }
  return result;
}

- (id)_setupCell:(id)a3 forTableView:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "row");
  switch(objc_msgSend(v10, "section"))
  {
    case 0:
      objc_msgSend(v8, "detailTextLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 0);

      objc_msgSend(MEMORY[0x1E0CEA478], "hu_alarmsPrimaryTextColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextColor:", v13);

      switch(v11)
      {
        case 0:
          -[HUAlarmEditViewController _datePickerCellForTableView:atIndexPath:](self, "_datePickerCellForTableView:atIndexPath:", v9, v10);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_48;
        case 1:
          _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmEditRepeat"), CFSTR("HUAlarmEditRepeat"), 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "textLabel");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setText:", v47);

          objc_msgSend(v8, "detailTextLabel");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setAdjustsFontSizeToFitWidth:", 1);

          objc_msgSend(v8, "detailTextLabel");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setMinimumScaleFactor:", 0.705882353);

          -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "repeatSchedule");
          DateMaskToString();
          v52 = objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        case 2:
          _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmEditLabel"), CFSTR("HUAlarmEditLabel"), 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "textLabel");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setText:", v53);

          -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "displayTitle");
          v52 = objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        case 3:
          _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmPlayInLabel"), CFSTR("HUAlarmPlayInLabel"), 1);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "textLabel");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setText:", v55);

          -[HUAlarmEditViewController selectedRoom](self, "selectedRoom");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "name");
          v52 = objc_claimAutoreleasedReturnValue();
LABEL_37:
          v57 = (void *)v52;
          objc_msgSend(v8, "detailTextLabel");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setText:", v57);

          objc_msgSend(v8, "setAccessoryType:", 1);
          break;
        default:
          goto LABEL_38;
      }
      goto LABEL_38;
    case 1:
      objc_msgSend(v8, "detailTextLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAdjustsFontSizeToFitWidth:", 0);

      objc_msgSend(MEMORY[0x1E0CEA478], "hu_alarmsPrimaryTextColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTextColor:", v17);

      if (v11 == 1)
      {
        objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HUPlayMediaCellIdentifier"), v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmPlayMedia"), CFSTR("HUAlarmPlayMedia"), 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "textLabel");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setText:", v43);

        if (-[HUAlarmEditViewController _shouldDisablePlayMedia](self, "_shouldDisablePlayMedia"))
        {
          objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "textLabel");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setTextColor:", v45);

          if (-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm"))
          {
            objc_msgSend(v19, "setUserInteractionEnabled:", 0);
          }
          else
          {
            -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setUserInteractionEnabled:", v69 != 0);

          }
        }
        if (!-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm"))
        {
LABEL_10:
          v22 = v19;
          v23 = 3;
          goto LABEL_45;
        }
      }
      else
      {
        if (v11)
        {
          v19 = v8;
          goto LABEL_46;
        }
        objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HUPlayToneCellIdentifier"), v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmPlayTone"), CFSTR("HUAlarmPlayTone"), 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "textLabel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setText:", v20);

        if (-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm"))
          goto LABEL_10;
      }
      v22 = v19;
      v23 = 0;
LABEL_45:
      objc_msgSend(v22, "setAccessoryType:", v23);
LABEL_46:
      v15 = v19;
LABEL_47:
      v8 = v15;
LABEL_48:
      v24 = v15;
LABEL_49:

      return v24;
    case 2:
      if (-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm"))
        goto LABEL_33;
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 3, CFSTR("HUChooseMediahCellReuseIdentifier"));
      objc_msgSend(MEMORY[0x1E0CEA478], "hu_alarmsPrimaryTextColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "textLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTextColor:", v25);

      if (v11 == 1)
      {
        _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmEditAlarmChooseMedia"), CFSTR("HUAlarmEditAlarmChooseMedia"), 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "textLabel");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setText:", v59);

        objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "textLabel");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setTextColor:", v61);

        objc_msgSend(v24, "imageView");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setImage:", 0);

      }
      else if (!v11)
      {
        if (-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
        {
          -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "mediaPlayerPlaybackArchive");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "displayProperties");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "title");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "textLabel");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setText:", v30);

          -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "mediaPlayerPlaybackArchive");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "displayProperties");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "subtitle");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "detailTextLabel");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setText:", v35);

          objc_msgSend(v24, "detailTextLabel");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setAdjustsFontSizeToFitWidth:", 1);

          objc_msgSend(v24, "detailTextLabel");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setMinimumScaleFactor:", 0.705882353);

          v39 = (void *)MEMORY[0x1E0CEA638];
          -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "artworkImageData");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "imageWithData:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          -[HUAlarmEditViewController _configureMediaIconView:withImage:](self, "_configureMediaIconView:withImage:", v24, v42);
          objc_msgSend(v24, "setUserInteractionEnabled:", 0);
        }
        else
        {
          objc_msgSend(v24, "setUserInteractionEnabled:", 1);
          objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "textLabel");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setTextColor:", v64);

          objc_msgSend(v24, "imageView");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "setImage:", 0);

          _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmEditAlarmChooseMedia"), CFSTR("HUAlarmEditAlarmChooseMedia"), 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "textLabel");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setText:", v67);

          objc_msgSend(v24, "detailTextLabel");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setText:", 0);
        }

        objc_msgSend(v24, "setAccessoryView:", 0);
      }
      goto LABEL_49;
    case 3:
      if (!-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia")
        || -[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm"))
      {
        goto LABEL_20;
      }
      -[HUAlarmEditViewController _mediaPropertiesTypeCellForTableView:atIndexpath:](self, "_mediaPropertiesTypeCellForTableView:atIndexpath:", v9, v10);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    case 4:
      if (!-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia")
        && !-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm"))
      {
        if (-[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume"))
        {
LABEL_32:
          -[HUAlarmEditViewController _volumeSliderCellForTableView:atIndexPath:](self, "_volumeSliderCellForTableView:atIndexPath:", v9, v10);
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_33:
          -[HUAlarmEditViewController _deleteAlarmButtonCellForTableView:atIndexPath:](self, "_deleteAlarmButtonCellForTableView:atIndexPath:", v9, v10);
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_48;
      }
      if (-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia")
        && !-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm"))
      {
LABEL_20:
        -[HUAlarmEditViewController _volumeTypeCellForTableView:atIndexpath:](self, "_volumeTypeCellForTableView:atIndexpath:", v9, v10);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_48;
      }
LABEL_38:
      v15 = v8;
      goto LABEL_47;
    case 5:
      if (-[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume")
        && -[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
      {
        goto LABEL_32;
      }
      if (-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm")
        && !-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia")
        || -[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm"))
      {
        goto LABEL_38;
      }
      goto LABEL_33;
    case 6:
      goto LABEL_33;
    default:
      goto LABEL_38;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  v9 = objc_msgSend(v7, "section");
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("HUAlarmEditViewControllerTableViewCellIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 3, CFSTR("HUAlarmEditViewControllerTableViewCellIdentifier"));
  if (!-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    if (v9 == 1)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("HUAlarmEditTableViewCellIdentifier"));

      _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmEditDelete"), CFSTR("HUAlarmEditDelete"), 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "textLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setText:", v22);

      objc_msgSend(v21, "textLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTextAlignment:", 1);

      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "textLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTextColor:", v25);

      v27 = v21;
LABEL_18:
      v11 = v27;
      v10 = v27;
      goto LABEL_19;
    }
    if (v9)
    {
LABEL_12:
      v11 = 0;
      goto LABEL_19;
    }
    objc_msgSend(v10, "detailTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 0);

    objc_msgSend(v10, "setAccessoryType:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "hu_alarmsPrimaryTextColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

    switch(v8)
    {
      case 2:
        _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmPlayInLabel"), CFSTR("HUAlarmPlayInLabel"), 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textLabel");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setText:", v28);

        -[HUAlarmEditViewController selectedRoom](self, "selectedRoom");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "detailTextLabel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setText:", v31);

        objc_msgSend(v10, "setAccessoryType:", 1);
        break;
      case 1:
        _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmEditLabel"), CFSTR("HUAlarmEditLabel"), 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textLabel");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setText:", v33);

        -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "displayTitle");
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 0:
        _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmEditRepeat"), CFSTR("HUAlarmEditRepeat"), 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setText:", v15);

        objc_msgSend(v10, "detailTextLabel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setAdjustsFontSizeToFitWidth:", 1);

        objc_msgSend(v10, "detailTextLabel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setMinimumScaleFactor:", 0.705882353);

        -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "repeatSchedule");
        DateMaskToString();
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v35 = (void *)v20;
        objc_msgSend(v10, "detailTextLabel");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setText:", v35);

        break;
    }
    v27 = v10;
    goto LABEL_18;
  }
  switch(v9)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      -[HUAlarmEditViewController _setupCell:forTableView:indexPath:](self, "_setupCell:forTableView:indexPath:", v10, v6, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      goto LABEL_12;
  }
LABEL_19:

  return v11;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;

  if (!objc_msgSend(MEMORY[0x1E0D319D0], "isAMac", a3))
    goto LABEL_7;
  if (!-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm")
    && !-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm"))
  {
    if (a4 == 2)
      goto LABEL_5;
LABEL_7:
    v6 = 0;
    return v6;
  }
  if (a4 != 1)
    goto LABEL_7;
LABEL_5:
  _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmMediaActionPlayUnavailableMessage"), CFSTR("HUAlarmMediaActionPlayUnavailableMessage"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (void)_updateCellForTableView:(id)a3 indexPath:(id)a4
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  HUAlarmEditViewController *v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v5 = -[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm");
  v6 = v16;
  if (v5)
  {
    v7 = objc_msgSend(v16, "section");
    v8 = objc_msgSend(v16, "row");
    v9 = v8;
    if (v7 != 4)
    {
      if (v7 == 1)
      {
        if (v8 == 1)
        {
          -[HUAlarmEditViewController setIsPlayMediaSelected:](self, "setIsPlayMediaSelected:", 1);
          if (-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm"))
          {
            v13 = 0;
LABEL_18:
            -[HUAlarmEditViewController _updateEnableStateForDoneButton:](self, "_updateEnableStateForDoneButton:", v13);
            goto LABEL_19;
          }
          v10 = -[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia");
LABEL_17:
          v13 = v10;
          goto LABEL_18;
        }
        if (!v8)
        {
          -[HUAlarmEditViewController setIsPlayMediaSelected:](self, "setIsPlayMediaSelected:", 0);
          -[HUAlarmEditViewController setIsCustomVolumeSelected:](self, "setIsCustomVolumeSelected:", 0);
          v10 = -[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm");
          goto LABEL_17;
        }
LABEL_19:
        -[HUAlarmEditViewController editAlarmView](self, "editAlarmView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "settingsTable");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "reloadData");

        v6 = v16;
        goto LABEL_20;
      }
      if (-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm")
        || -[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
      {
        goto LABEL_19;
      }
    }
    if (v9 == 1)
    {
      v11 = self;
      v12 = 1;
    }
    else
    {
      if (v9)
        goto LABEL_19;
      v11 = self;
      v12 = 0;
    }
    -[HUAlarmEditViewController setIsCustomVolumeSelected:](v11, "setIsCustomVolumeSelected:", v12);
    goto LABEL_19;
  }
LABEL_20:

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  HUAlarmEditViewController *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  v8 = objc_msgSend(v6, "section");
  objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v6, 1);
  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    switch(v8)
    {
      case 0:
        if ((unint64_t)(v7 - 1) <= 2)
        {
          v9 = self;
          v10 = v7;
          goto LABEL_9;
        }
        break;
      case 1:
      case 3:
        goto LABEL_17;
      case 2:
        if (!-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm")
          && !-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia")
          && -[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm"))
        {
          goto LABEL_23;
        }
        -[HUAlarmEditViewController _chooseMediaTapped](self, "_chooseMediaTapped");
        break;
      case 4:
        if (HUIsPhoneIdiom()
          && !-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm")
          && !-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
        {
          goto LABEL_23;
        }
LABEL_17:
        -[HUAlarmEditViewController _updateCellForTableView:indexPath:](self, "_updateCellForTableView:indexPath:", v13, v6);
        break;
      case 5:
        if (!-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm")
          && (!-[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume")
           || !-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia")))
        {
          goto LABEL_23;
        }
        break;
      case 6:
        if (!-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm"))
          goto LABEL_23;
        break;
      default:
        break;
    }
  }
  else if (v8 == 1)
  {
LABEL_23:
    -[HUAlarmEditViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditViewController originalAlarm](self, "originalAlarm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alarmEditController:didDeleteAlarm:", self, v12);

  }
  else if (!v8 && v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v7 + 1;
    v9 = self;
LABEL_9:
    -[HUAlarmEditViewController startEditingSetting:](v9, "startEditingSetting:", v10);
  }

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  __CFString *v6;
  void *v7;

  if (!-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm", a3))
    goto LABEL_13;
  if (a4 == 1)
  {
    v6 = CFSTR("HUAlarmEditAlarmSound");
  }
  else
  {
    if (a4 == 4)
    {
      if (-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm")
        || !-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
      {
        goto LABEL_13;
      }
    }
    else if (a4 != 3
           || -[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm")
           || -[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
    {
LABEL_13:
      v7 = 0;
      return v7;
    }
    v6 = CFSTR("HUAlarmEditAlarmVolume");
  }
  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;

  v5 = a4;
  if (objc_msgSend(v5, "section") == 2
    && -[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia")
    && !objc_msgSend(v5, "row"))
  {
    v6 = 100.0;
  }
  else
  {
    v6 = *MEMORY[0x1E0CEBC10];
  }

  return v6;
}

- (void)_configureMediaIconView:(id)a3 withImage:(id)a4
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
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    if (v6)
    {
      objc_msgSend(v6, "hu_imageScaledToSize:contentMode:", 2, 72.0, 72.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setImage:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 24.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("music"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageWithSymbolConfiguration:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setImage:", v10);

      objc_msgSend(v19, "imageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setContentMode:", 4);

      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTintColor:", v8);

    }
    objc_msgSend(v19, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerRadius:", 4.0);

    objc_msgSend(v19, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClipsToBounds:", 1);

    objc_msgSend(v19, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

    objc_msgSend(v19, "imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);

  }
}

- (id)_dateComponents
{
  id v3;
  void *v4;
  void *v5;

  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    if (_MergedGlobals_6 != -1)
      dispatch_once(&_MergedGlobals_6, &__block_literal_global_93_1);
    v3 = (id)qword_1EF226A60;
    -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHour:", objc_msgSend(v4, "hour"));

    -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMinute:", objc_msgSend(v5, "minute"));

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void __44__HUAlarmEditViewController__dateComponents__block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v1 = (void *)qword_1EF226A60;
  qword_1EF226A60 = (uint64_t)v0;

}

- (void)_chooseMediaTapped
{
  HUMediaSourceListViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    if (_os_feature_enabled_impl())
    {
      v3 = [HUMediaSourceListViewController alloc];
      v4 = (void *)MEMORY[0x1E0C99E60];
      -[HUAlarmEditViewController mediaProfileContainer](self, "mediaProfileContainer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setWithObject:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HUMediaSourceListViewController initForMediaProfileContainers:forTarget:](v3, "initForMediaProfileContainers:forTarget:", v6, 1);

      objc_msgSend(v14, "setDelegate:", self);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v14);
      -[HUAlarmEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
LABEL_9:

      return;
    }
    v8 = +[HUMediaAccountUtilities isMusicAppInstalled](HUMediaAccountUtilities, "isMusicAppInstalled");
    -[HUAlarmEditViewController appleMusicSubcriptionResult](self, "appleMusicSubcriptionResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    if (!v8)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HUMediaPickerUnavailableReasonStoreKitErrorObjectKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAlarmEditViewController _presentMediaPickerUnavailablePromptWithReason:storeKitErrorObject:](self, "_presentMediaPickerUnavailablePromptWithReason:storeKitErrorObject:", 0, v7);
      goto LABEL_9;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HOMediaPickerUnavailableReasonKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HUAlarmEditViewController appleMusicSubcriptionResult](self, "appleMusicSubcriptionResult");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HOMediaPickerUnavailableReasonKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "integerValue");
      -[HUAlarmEditViewController appleMusicSubcriptionResult](self, "appleMusicSubcriptionResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("HUMediaPickerUnavailableReasonStoreKitErrorObjectKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAlarmEditViewController _presentMediaPickerUnavailablePromptWithReason:storeKitErrorObject:](self, "_presentMediaPickerUnavailablePromptWithReason:storeKitErrorObject:", v11, v13);

      goto LABEL_9;
    }
    -[HUAlarmEditViewController _presentMediaPickerWithOptionsShowsLibraryContent:](self, "_presentMediaPickerWithOptionsShowsLibraryContent:", 1);
  }
}

- (id)_deleteAlarmButtonCellForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("HUAlarmEditTableViewCellIdentifier"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("HUAlarmEditTableViewCellIdentifier"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmEditDelete"), CFSTR("HUAlarmEditDelete"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v4, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  return v4;
}

- (id)_volumeSliderCellForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HUVolumeSliderCellReuseIdentifier"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setMinimumValue:", 0.0);
  objc_msgSend(v8, "setMaximumValue:", 100.0);
  -[HUAlarmEditViewController _volumeIconMinimum](self, "_volumeIconMinimum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinimumValueImage:", v9);

  -[HUAlarmEditViewController _volumeIconMaximum](self, "_volumeIconMaximum");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMaximumValueImage:", v10);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v11);

  objc_msgSend(v8, "setShowValue:", 0);
  objc_msgSend(v8, "setHidden:", -[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume") ^ 1);
  -[HUAlarmEditViewController _volumeSettingForCurrentEditingAlarm](self, "_volumeSettingForCurrentEditingAlarm");
  objc_msgSend(v8, "setValue:");
  objc_msgSend(v8, "value");
  -[HUAlarmEditViewController setSelectedCustomVolumeLevel:](self, "setSelectedCustomVolumeLevel:");

  return v8;
}

- (id)_volumeIconMinimum
{
  if (qword_1EF226A70 != -1)
    dispatch_once(&qword_1EF226A70, &__block_literal_global_99);
  return (id)qword_1EF226A68;
}

void __47__HUAlarmEditViewController__volumeIconMinimum__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("speaker.fill"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTintColor:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1EF226A68;
  qword_1EF226A68 = v1;

}

- (id)_volumeIconMaximum
{
  if (qword_1EF226A80 != -1)
    dispatch_once(&qword_1EF226A80, &__block_literal_global_102);
  return (id)qword_1EF226A78;
}

void __47__HUAlarmEditViewController__volumeIconMaximum__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("speaker.wave.3.fill"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTintColor:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1EF226A78;
  qword_1EF226A78 = v1;

}

- (id)_datePickerCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[HUAlarmEditViewController isDatePickerWheelScrolled](self, "isDatePickerWheelScrolled"))
  {
    -[HUAlarmEditViewController _dateComponents](self, "_dateComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTimeComponents:", v11);

    objc_msgSend(v10, "timeComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditViewController setCurrentDatePickerTimeComponents:](self, "setCurrentDatePickerTimeComponents:", v12);

  }
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setHideTitleLabel:", 1);
  objc_msgSend(v10, "setLeftMargin:", 10.0);
  objc_msgSend(v10, "setSeparatorInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));
  return v10;
}

- (id)_mediaPropertiesTypeCellForTableView:(id)a3 atIndexpath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "row"))
  {
    if (objc_msgSend(v7, "row") != 1)
    {
      v11 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HUShuffleMusicSwitchCellReuseIdentifier"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOn:", objc_msgSend(v12, "isShuffleEnabled"));

    -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDisabled:", objc_msgSend(v13, "isShuffleSupported") ^ 1);

    v14 = CFSTR("HUMediaSelectionQueueModifierShuffle");
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HURepeatMusicSwitchCellReuseIdentifier"), v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v9;
    else
      v16 = 0;
    v11 = v16;

    -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOn:", objc_msgSend(v17, "isRepeatEnabled"));

    -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDisabled:", objc_msgSend(v18, "isRepeatSupported") ^ 1);

    v14 = CFSTR("HUMediaSelectionQueueModifierRepeat");
  }
  _HULocalizedStringWithDefaultValue(v14, v14, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v19);

  objc_msgSend(v11, "setDelegate:", self);
LABEL_13:

  return v11;
}

- (id)_volumeTypeCellForTableView:(id)a3 atIndexpath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("HUVolumeTypeReuseIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("HUVolumeTypeReuseIdentifier"));
  v8 = objc_msgSend(v6, "row");
  if (v8 == 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmEditAlarmUseCustomVolume"), CFSTR("HUAlarmEditAlarmUseCustomVolume"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    if (-[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume"))
      v12 = 3;
    else
      v12 = 0;
    goto LABEL_11;
  }
  if (!v8)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmEditAlarmUseCurrentVolume"), CFSTR("HUAlarmEditAlarmUseCurrentVolume"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

    objc_msgSend(v7, "detailTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);

    if (-[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume"))
      v12 = 0;
    else
      v12 = 3;
LABEL_11:
    objc_msgSend(v7, "setAccessoryType:", v12);
  }

  return v7;
}

- (BOOL)_hasUserSelectedToneAlarm
{
  return !-[HUAlarmEditViewController isPlayMediaSelected](self, "isPlayMediaSelected");
}

- (BOOL)_isAlarmTypeMedia
{
  void *v3;
  _BOOL4 v4;

  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = !-[HUAlarmEditViewController _hasUserSelectedToneAlarm](self, "_hasUserSelectedToneAlarm");
    else
      LOBYTE(v4) = 0;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_isNewAlarm
{
  void *v2;
  BOOL v3;

  -[HUAlarmEditViewController originalAlarm](self, "originalAlarm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)isEdited
{
  int v3;
  void *v4;
  void *v5;

  if (-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[HUAlarmEditViewController originalAlarm](self, "originalAlarm");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqual:", v5) ^ 1;

  }
  return v3;
}

- (void)saveAlarmOnlyIfEdited:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
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
  int v31;
  void *v32;
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  if (!-[HUAlarmEditViewController isEdited](self, "isEdited") && v3)
    return;
  if (!-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    -[HUAlarmEditView timePicker](self->_editAlarmView, "timePicker");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject calendar](v12, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditView timePicker](self->_editAlarmView, "timePicker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "components:fromDate:", 96, v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  -[HUAlarmEditViewController currentDatePickerTimeComponents](self, "currentDatePickerTimeComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia");
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Saving Regular Alarm", (uint8_t *)&v31, 2u);
    }

    -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject setSound:](v12, "setSound:", 0);
    goto LABEL_16;
  }
  if (v8)
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Saving Media Type Alarm", (uint8_t *)&v31, 2u);
  }

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0)
  {
    -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditViewController _configureSoundForMediaTypeAlarm:](self, "_configureSoundForMediaTypeAlarm:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSound:", v10);

  }
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sound");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = v14;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Alarm Sound ..%@", (uint8_t *)&v31, 0xCu);
LABEL_12:

  }
LABEL_16:

  v16 = objc_msgSend(v5, "hour");
  -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHour:", v16);

  v18 = objc_msgSend(v5, "minute");
  -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMinute:", v18);

  -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmEditViewController selectedRoom](self, "selectedRoom");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmEditViewController mediaProfileContainer](self, "mediaProfileContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hf_moveToRoom:withMediaProfileContainer:", v21, v22);

  LODWORD(v21) = -[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm");
  HFLogForCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v21)
  {
    if (v24)
    {
      -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "description");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412290;
      v32 = v26;
      _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "New Alarm - Alarm Desc %@", (uint8_t *)&v31, 0xCu);

    }
    -[HUAlarmEditViewController delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "alarmEditController:didAddAlarm:", self, v28);
  }
  else
  {
    if (v24)
    {
      -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "description");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412290;
      v32 = v30;
      _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "Edit Alarm - Alarm Desc %@", (uint8_t *)&v31, 0xCu);

    }
    -[HUAlarmEditViewController delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "alarmEditController:didEditAlarm:", self, v28);
  }

}

- (void)_cancelButtonClicked:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  HUAlarmEditViewController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[HUAlarmEditViewController _cancelButtonClicked:]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%s(%@) canceling", (uint8_t *)&v6, 0x16u);
  }

  -[HUAlarmEditViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alarmEditControllerDidCancel:", self);

}

- (void)_doneButtonClicked:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  HUAlarmEditViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[HUAlarmEditViewController _doneButtonClicked:]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%s(%@) done", (uint8_t *)&v5, 0x16u);
  }

  -[HUAlarmEditViewController saveAlarmOnlyIfEdited:](self, "saveAlarmOnlyIfEdited:", 0);
}

- (void)startEditingSetting:(int64_t)a3
{
  HUAlarmEditSettingViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HUAlarmEditSettingViewController *v11;

  self->_editingAlarmSetting = a3;
  v5 = [HUAlarmEditSettingViewController alloc];
  -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmEditViewController mediaProfileContainer](self, "mediaProfileContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmEditViewController selectedRoom](self, "selectedRoom");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmEditViewController loggedInAppleMusicAccountDSID](self, "loggedInAppleMusicAccountDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUAlarmEditSettingViewController initWithAlarm:setting:mediaProfileContainer:selectedRoom:loggedInAppleMusicAccountDSID:](v5, "initWithAlarm:setting:mediaProfileContainer:selectedRoom:loggedInAppleMusicAccountDSID:", v6, a3, v7, v8, v9);

  -[HUAlarmEditSettingViewController setDelegate:](v11, "setDelegate:", self);
  -[HUAlarmEditViewController preferredContentSize](self, "preferredContentSize");
  -[HUAlarmEditSettingViewController setPreferredContentSize:](v11, "setPreferredContentSize:");
  -[HUAlarmEditViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v11, 1);

}

- (void)_handlePickerChanged
{
  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
    -[HUAlarmEditViewController setIsDatePickerWheelScrolled:](self, "setIsDatePickerWheelScrolled:", 1);
}

- (void)_updateEnableStateForDoneButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    -[HUAlarmEditViewController navigationItem](self, "navigationItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

  }
}

- (void)_updateAppleMusicSubscriptionStatus
{
  NSMutableDictionary *v3;
  NSMutableDictionary *appleMusicSubcriptionResult;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    appleMusicSubcriptionResult = self->_appleMusicSubcriptionResult;
    self->_appleMusicSubcriptionResult = v3;

    -[HUAlarmEditViewController mediaProfileContainer](self, "mediaProfileContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaProfiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_homePodMediaProfiles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditViewController mediaProfileContainer](self, "mediaProfileContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUMediaAccountUtilities determineMediaPickerAvailabilityForHomePodProfiles:inHome:](HUMediaAccountUtilities, "determineMediaPickerAvailabilityForHomePodProfiles:inHome:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__HUAlarmEditViewController__updateAppleMusicSubscriptionStatus__block_invoke;
    v16[3] = &unk_1E6F51B60;
    objc_copyWeak(&v17, &location);
    v12 = (id)objc_msgSend(v10, "addSuccessBlock:", v16);
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __64__HUAlarmEditViewController__updateAppleMusicSubscriptionStatus__block_invoke_2;
    v14[3] = &unk_1E6F4ED68;
    objc_copyWeak(&v15, &location);
    v13 = (id)objc_msgSend(v10, "addFailureBlock:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

void __64__HUAlarmEditViewController__updateAppleMusicSubscriptionStatus__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    objc_msgSend(WeakRetained, "appleMusicSubcriptionResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDictionary:", v5);

  }
}

void __64__HUAlarmEditViewController__updateAppleMusicSubscriptionStatus__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    objc_msgSend(WeakRetained, "appleMusicSubcriptionResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("HUAppleMusicSubscriptionErrorKey"));

  }
}

- (void)_loadArtworkForMediaAlarm
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaPlayerPlaybackArchive");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "displayProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkImageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Loading artwork for Media Alarm [%@]", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__HUAlarmEditViewController__loadArtworkForMediaAlarm__block_invoke;
    v11[3] = &unk_1E6F54668;
    objc_copyWeak(&v12, (id *)buf);
    objc_msgSend(v3, "dataTaskWithURL:completionHandler:", v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditViewController setArtworkFetchTask:](self, "setArtworkFetchTask:", v9);

    -[HUAlarmEditViewController artworkFetchTask](self, "artworkFetchTask");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume");

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

void __54__HUAlarmEditViewController__loadArtworkForMediaAlarm__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v6 = a2;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HUAlarmEditViewController__loadArtworkForMediaAlarm__block_invoke_2;
  block[3] = &unk_1E6F4C7A8;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v13);
}

void __54__HUAlarmEditViewController__loadArtworkForMediaAlarm__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setArtworkFetchTask:", 0);
    v4 = *(void **)(a1 + 32);
    if (v4 || !*(_QWORD *)(a1 + 40))
    {
      if (objc_msgSend(v4, "code") == -999
        && (objc_msgSend(*(id *)(a1 + 32), "domain"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            v6 = objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0CB32E8]),
            v5,
            v6))
      {
        HFLogForCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Loading artwork for Media Alarm cancelled.", (uint8_t *)&v13, 2u);
        }
      }
      else
      {
        HFLogForCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = *(_QWORD *)(a1 + 32);
          v13 = 138543362;
          v14 = v8;
          _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "Failed to load artwort. Error: %{public}@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
    else
    {
      HFLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Loading artwork for Media Alarm done.", (uint8_t *)&v13, 2u);
      }

      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "hfPlaybackArchive");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setArtworkImageData:", v10);

      objc_msgSend(v3, "editAlarmView");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject settingsTable](v7, "settingsTable");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reloadData");

    }
  }

}

- (void)_checkAndPrepareEditingAlarmForMediaTypeAlarm
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  float v21;
  HFPlaybackArchive *v22;
  HFPlaybackArchive *hfPlaybackArchive;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[MTMutableAlarm sound](self->_editedAlarm, "sound");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toneIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[MTMutableAlarm sound](self->_editedAlarm, "sound");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      objc_msgSend(getTLToneManagerClass(), "sharedToneManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTMutableAlarm sound](self->_editedAlarm, "sound");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "toneIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_underlyingPlaybackArchiveForToneIdentifier:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sound");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "soundVolume");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[HUAlarmEditViewController setIsCustomVolumeSelected:](self, "setIsCustomVolumeSelected:", 1);
          -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "sound");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "soundVolume");
        }
        else
        {
          -[HUAlarmEditViewController mediaProfileContainer](self, "mediaProfileContainer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "mediaProfiles");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[HUMediaAccountUtilities defaultCurrentVolumeForMediaProfiles:](HUMediaAccountUtilities, "defaultCurrentVolumeForMediaProfiles:", v17);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "floatValue");
        -[HUAlarmEditViewController setSelectedCustomVolumeLevel:](self, "setSelectedCustomVolumeLevel:", v21);

        v22 = (HFPlaybackArchive *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31660]), "initWithMediaPlayerPlaybackArchive:", v12);
        hfPlaybackArchive = self->_hfPlaybackArchive;
        self->_hfPlaybackArchive = v22;

        if (self->_hfPlaybackArchive)
        {
          -[NSObject displayProperties](v12, "displayProperties");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "artworkImageData");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {

          }
          else
          {
            -[NSObject displayProperties](v12, "displayProperties");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "artworkImageURL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
              -[HUAlarmEditViewController _loadArtworkForMediaAlarm](self, "_loadArtworkForMediaAlarm");
          }
          -[HUAlarmEditViewController setIsPlayMediaSelected:](self, "setIsPlayMediaSelected:", 1);
          HFLogForCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "description");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[MTMutableAlarm sound](self->_editedAlarm, "sound");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "toneIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 138412802;
            v33 = v29;
            v34 = 2112;
            v35 = v31;
            v36 = 2112;
            v37 = v12;
            _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "Editing Alarm is Media Alarm. Description %@, ToneIdentifier %@, playbackArchiveObj from TL %@", (uint8_t *)&v32, 0x20u);

          }
          goto LABEL_22;
        }
        HFLogForCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v32) = 0;
          v19 = "Editing Alarm - Error preparing hfPlaybackArchive. Treating as Regular Alarm";
          goto LABEL_17;
        }
      }
      else
      {
        HFLogForCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v32) = 0;
          v19 = "Editing Alarm - Error converting tone identifier into playback archive by TL. Treating as Regular Alarm";
LABEL_17:
          _os_log_error_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v32, 2u);
        }
      }
LABEL_22:

      goto LABEL_23;
    }
  }
  else
  {

  }
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v32) = 0;
    _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "Editing Alarm toneIdentifier is nil. Treating as Regular Alarm", (uint8_t *)&v32, 2u);
  }
LABEL_23:

}

- (id)_configureSoundForMediaTypeAlarm:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v21;
  NSObject *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mediaPlayerPlaybackArchive");
  v5 = objc_claimAutoreleasedReturnValue();
  -[NSObject displayProperties](v5, "displayProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkImageData");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[NSObject displayProperties](v5, "displayProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "artworkImageURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      HFLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "Stripping artwork from Media Alarm", (uint8_t *)&v21, 2u);
      }

      v12 = -[NSObject copyWithOptions:](v5, "copyWithOptions:", 8);
      v5 = v12;
    }
  }
  else
  {

  }
  objc_msgSend(getTLToneManagerClass(), "sharedToneManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_toneIdentifierWithUnderlyingPlaybackArchive:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (-[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume"))
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      -[HUAlarmEditViewController _volumeSettingForCurrentEditingAlarm](self, "_volumeSettingForCurrentEditingAlarm");
      objc_msgSend(v15, "numberWithDouble:");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(MEMORY[0x1E0D4FA78], "toneSoundWithIdentifier:vibrationIdentifer:volume:", v14, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "mediaPlayerPlaybackArchive");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138413058;
      v22 = v16;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v14;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "Saving as Media Alarm volume..%@ playback archive properties %@ ToneIdentifier from Tone Library %@ CustomSound %@", (uint8_t *)&v21, 0x2Au);

    }
  }
  else
  {
    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v21 = 138412290;
      v22 = v5;
      _os_log_error_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_ERROR, "Failed to convert playback archive %@ into a tone identifier.", (uint8_t *)&v21, 0xCu);
    }
    v17 = 0;
  }

  return v17;
}

- (BOOL)_isMusicAlarmSupportedInAccessory
{
  void *v2;
  char v3;

  -[HUAlarmEditViewController mediaProfileContainer](self, "mediaProfileContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_supportsMusicAlarm");

  return v3;
}

- (BOOL)_shouldDisablePlayMedia
{
  return objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
}

- (void)alarmEditSettingController:(id)a3 didEditAlarm:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "selectedRoom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAlarmEditViewController setSelectedRoom:](self, "setSelectedRoom:", v7);

  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  -[HUAlarmEditViewController setEditedAlarm:](self, "setEditedAlarm:", v8);

  -[HUAlarmEditView settingsTable](self->_editAlarmView, "settingsTable");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;

  v4 = a4;
  v19 = a3;
  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    objc_msgSend(v19, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUAlarmEditAlarmSnooze"), CFSTR("HUAlarmEditAlarmSnooze"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
    {
      -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAllowsSnooze:", v4);
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v19, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSelectionQueueModifierRepeat"), CFSTR("HUMediaSelectionQueueModifierRepeat"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v14)
    {
      -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRepeatEnabled:", v4);
      goto LABEL_8;
    }
    objc_msgSend(v19, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUMediaSelectionQueueModifierShuffle"), CFSTR("HUMediaSelectionQueueModifierShuffle"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    if (v18)
    {
      -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShuffleEnabled:", v4);
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4
{
  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm", a3))
    -[HUAlarmEditViewController setSelectedCustomVolumeLevel:](self, "setSelectedCustomVolumeLevel:", a4);
}

- (void)datePickerCell:(id)a3 didSelectDate:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    -[HUAlarmEditViewController setIsDatePickerWheelScrolled:](self, "setIsDatePickerWheelScrolled:", 1);
    objc_msgSend(v6, "timeComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlarmEditViewController setCurrentDatePickerTimeComponents:](self, "setCurrentDatePickerTimeComponents:", v5);

  }
}

- (void)mediaPicker:(id)a3 didPickPlaybackArchive:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    -[HUAlarmEditViewController artworkFetchTask](self, "artworkFetchTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancel");

    -[HUAlarmEditViewController setHfPlaybackArchive:](self, "setHfPlaybackArchive:", 0);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31660]), "initWithMediaPlayerPlaybackArchive:", v5);
    -[HUAlarmEditViewController setHfPlaybackArchive:](self, "setHfPlaybackArchive:", v7);

    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "didPickPlaybackArchive Media Alarm. Description %@", buf, 0xCu);

    }
    -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutoPlayEnabled:", 0);

    -[HUAlarmEditViewController editAlarmView](self, "editAlarmView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "settingsTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reloadData");

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__HUAlarmEditViewController_mediaPicker_didPickPlaybackArchive___block_invoke;
    v14[3] = &unk_1E6F4D988;
    v14[4] = self;
    -[HUAlarmEditViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v14);
  }

}

uint64_t __64__HUAlarmEditViewController_mediaPicker_didPickPlaybackArchive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEnableStateForDoneButton:", objc_msgSend(*(id *)(a1 + 32), "_isAlarmTypeMedia"));
}

- (void)_presentMediaPickerWithOptionsShowsLibraryContent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a3;
  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v5 = (void *)qword_1EF226A98;
    v26 = qword_1EF226A98;
    if (!qword_1EF226A98)
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __getMPMediaPickerControllerClass_block_invoke_0;
      v21 = &unk_1E6F4C868;
      v22 = &v23;
      __getMPMediaPickerControllerClass_block_invoke_0((uint64_t)&v18);
      v5 = (void *)v24[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v23, 8);
    v7 = (void *)objc_msgSend([v6 alloc], "initWithSupportedTypeIdentifiers:selectionMode:", &unk_1E7042CC0, 4);
    objc_msgSend(v7, "setShowsCloudItems:", 1);
    objc_msgSend(v7, "setShowsItemsWithProtectedAssets:", 1);
    objc_msgSend(v7, "setShowsCatalogContent:", 1);
    objc_msgSend(v7, "setShowsLibraryContent:", v3);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scale");
    v10 = v9;

    if (v10 <= 4.0)
      v11 = 256.0;
    else
      v11 = v10 * 64.0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v12 = (void *)qword_1EF226AA0;
    v26 = qword_1EF226AA0;
    if (!qword_1EF226AA0)
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __getMPPlaybackArchiveConfigurationClass_block_invoke_0;
      v21 = &unk_1E6F4C868;
      v22 = &v23;
      __getMPPlaybackArchiveConfigurationClass_block_invoke_0((uint64_t)&v18);
      v12 = (void *)v24[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v23, 8);
    v14 = (void *)objc_msgSend([v13 alloc], "initWithPreferredArtworkSize:", v11, v11);
    objc_msgSend(v7, "setPlaybackArchiveConfiguration:", v14);

    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v7, "setModalPresentationStyle:", 2);
    -[HUAlarmEditViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    objc_msgSend(v7, "setPreferredContentSize:", v16, v17);

    -[HUAlarmEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }
}

- (void)mediaPickerDidCancel:(id)a3
{
  -[HUAlarmEditViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)mediaPickerDidPickPlaybackArchive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
  {
    -[HUAlarmEditViewController artworkFetchTask](self, "artworkFetchTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

    -[HUAlarmEditViewController setHfPlaybackArchive:](self, "setHfPlaybackArchive:", 0);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31660]), "initWithMediaPlayerPlaybackArchive:", v4);
    -[HUAlarmEditViewController setHfPlaybackArchive:](self, "setHfPlaybackArchive:", v6);

    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "didPickPlaybackArchive Media Alarm. Description %@", (uint8_t *)&v13, 0xCu);

    }
    -[HUAlarmEditViewController hfPlaybackArchive](self, "hfPlaybackArchive");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAutoPlayEnabled:", 0);

    -[HUAlarmEditViewController editAlarmView](self, "editAlarmView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "settingsTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadData");

    -[HUAlarmEditViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    -[HUAlarmEditViewController _updateEnableStateForDoneButton:](self, "_updateEnableStateForDoneButton:", -[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"));
  }

}

- (double)_volumeSettingForCurrentEditingAlarm
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  double v24;
  double v25;
  NSObject *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  int v32;
  double v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  if (!-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
    return v3;
  -[HUAlarmEditViewController mediaProfileContainer](self, "mediaProfileContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUMediaAccountUtilities defaultCurrentVolumeForMediaProfiles:](HUMediaAccountUtilities, "defaultCurrentVolumeForMediaProfiles:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  if (-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm"))
  {
    -[HUAlarmEditViewController selectedCustomVolumeLevel](self, "selectedCustomVolumeLevel");
    v3 = v8;
    if (v9 != v8)
    {
LABEL_4:
      -[HUAlarmEditViewController selectedCustomVolumeLevel](self, "selectedCustomVolumeLevel");
      v3 = v10;
    }
  }
  else
  {
    -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sound");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "soundVolume");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sound");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "soundVolume");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v18 = v17;
      -[HUAlarmEditViewController selectedCustomVolumeLevel](self, "selectedCustomVolumeLevel");
      if (v19 == v18)
      {
        -[HUAlarmEditViewController editedAlarm](self, "editedAlarm");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sound");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "soundVolume");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "floatValue");
        v3 = v23;

      }
      else
      {
        -[HUAlarmEditViewController selectedCustomVolumeLevel](self, "selectedCustomVolumeLevel");
        v3 = v25;
      }

      goto LABEL_13;
    }
    -[HUAlarmEditViewController selectedCustomVolumeLevel](self, "selectedCustomVolumeLevel");
    v3 = v8;
    if (v24 != v8)
    {
      v3 = v8;
      if (-[HUAlarmEditViewController _isAlarmTypeMedia](self, "_isAlarmTypeMedia"))
        goto LABEL_4;
    }
  }
LABEL_13:
  HFLogForCategory();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    if (-[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume"))
      v27 = CFSTR("YES");
    else
      v27 = CFSTR("NO");
    -[HUAlarmEditViewController selectedCustomVolumeLevel](self, "selectedCustomVolumeLevel");
    v29 = v28;
    v32 = 134219010;
    if (-[HUAlarmEditViewController _isNewAlarm](self, "_isNewAlarm"))
      v30 = CFSTR("YES");
    else
      v30 = CFSTR("NO");
    v33 = v8;
    v34 = 2112;
    v35 = v27;
    v36 = 2048;
    v37 = v29;
    v38 = 2112;
    v39 = v30;
    v40 = 2048;
    v41 = v3;
    _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "Volume Setting:  Default Volume From Profile %f Custom Volume %@ User Toggled Volume Level %f New Alarm %@ VolumeSet %f", (uint8_t *)&v32, 0x34u);
  }

  return v3;
}

- (void)_presentMediaPickerUnavailablePromptWithReason:(int64_t)a3 storeKitErrorObject:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
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
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;

  v6 = a4;
  if (!-[HUAlarmEditViewController accessorySupportsMusicAlarm](self, "accessorySupportsMusicAlarm"))
    goto LABEL_17;
  switch(a3)
  {
    case 2:
      +[HUMediaAccountUtilities reasonForMediaPickerNotAvailable:](HUMediaAccountUtilities, "reasonForMediaPickerNotAvailable:", 2);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v21 = 0;
      v7 = 0;
      v9 = CFSTR("HUAlertError");
      if (!v8)
        goto LABEL_12;
      goto LABEL_10;
    case 1:
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("music://subscribe"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 1;
      v21 = CFSTR("HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptGetAppleMusicButton");
      v8 = CFSTR("HUMusicAlarmMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage");
      v9 = CFSTR("HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptTitle");
      goto LABEL_10;
    case 0:
      +[HUMediaAccountUtilities musicAppURL](HUMediaAccountUtilities, "musicAppURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("HUTriggerMediaPickerUnavailableMusicAppUninstalledForMusicAlarmPromptMessage");
      v9 = CFSTR("HUMediaPickerUnavailableMusicAppUninstalledPromptTitle");
      v10 = 1;
      v21 = CFSTR("HUMediaPickerUnavailableMusicAppUninstalledPromptOpenAppStoreButton");
      if (!v8)
        goto LABEL_12;
LABEL_10:
      _HULocalizedStringWithDefaultValue(v8, v8, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
  }
  v9 = 0;
  v7 = 0;
  v21 = 0;
  v10 = 0;
LABEL_12:
  objc_msgSend(v6, "localizedDescription", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
LABEL_13:
  v12 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(v9, v9, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v13, v11, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v17);

  if (v10 && v7)
  {
    v18 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(v21, v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __96__HUAlarmEditViewController__presentMediaPickerUnavailablePromptWithReason_storeKitErrorObject___block_invoke;
    v25 = &unk_1E6F4C6E0;
    v26 = v7;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, &v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v20);

  }
  -[HUAlarmEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0, v21, v22, v23, v24, v25);

LABEL_17:
}

void __96__HUAlarmEditViewController__presentMediaPickerUnavailablePromptWithReason_storeKitErrorObject___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "openURL:", *(_QWORD *)(a1 + 32));

}

- (HUAlarmEditViewControllerDelegate)delegate
{
  return (HUAlarmEditViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)loggedInAppleMusicAccountDSID
{
  return self->_loggedInAppleMusicAccountDSID;
}

- (void)setLoggedInAppleMusicAccountDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (NSSet)selectedActionSets
{
  return self->_selectedActionSets;
}

- (HUAlarmEditView)editAlarmView
{
  return self->_editAlarmView;
}

- (void)setEditAlarmView:(id)a3
{
  objc_storeStrong((id *)&self->_editAlarmView, a3);
}

- (int64_t)editingAlarmSetting
{
  return self->_editingAlarmSetting;
}

- (void)setEditingAlarmSetting:(int64_t)a3
{
  self->_editingAlarmSetting = a3;
}

- (MTAlarm)originalAlarm
{
  return self->_originalAlarm;
}

- (void)setOriginalAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_originalAlarm, a3);
}

- (MTMutableAlarm)editedAlarm
{
  return self->_editedAlarm;
}

- (void)setEditedAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_editedAlarm, a3);
}

- (double)selectedCustomVolumeLevel
{
  return self->_selectedCustomVolumeLevel;
}

- (void)setSelectedCustomVolumeLevel:(double)a3
{
  self->_selectedCustomVolumeLevel = a3;
}

- (BOOL)isCustomVolumeSelected
{
  return self->_isCustomVolumeSelected;
}

- (void)setIsCustomVolumeSelected:(BOOL)a3
{
  self->_isCustomVolumeSelected = a3;
}

- (BOOL)isPlayMediaSelected
{
  return self->_isPlayMediaSelected;
}

- (void)setIsPlayMediaSelected:(BOOL)a3
{
  self->_isPlayMediaSelected = a3;
}

- (BOOL)accessorySupportsMusicAlarm
{
  return self->_accessorySupportsMusicAlarm;
}

- (void)setAccessorySupportsMusicAlarm:(BOOL)a3
{
  self->_accessorySupportsMusicAlarm = a3;
}

- (HFPlaybackArchive)hfPlaybackArchive
{
  return self->_hfPlaybackArchive;
}

- (void)setHfPlaybackArchive:(id)a3
{
  objc_storeStrong((id *)&self->_hfPlaybackArchive, a3);
}

- (NSURLSessionDataTask)artworkFetchTask
{
  return self->_artworkFetchTask;
}

- (void)setArtworkFetchTask:(id)a3
{
  objc_storeStrong((id *)&self->_artworkFetchTask, a3);
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void)setMediaProfileContainer:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, a3);
}

- (NSMutableDictionary)appleMusicSubcriptionResult
{
  return self->_appleMusicSubcriptionResult;
}

- (void)setAppleMusicSubcriptionResult:(id)a3
{
  objc_storeStrong((id *)&self->_appleMusicSubcriptionResult, a3);
}

- (BOOL)isDatePickerWheelScrolled
{
  return self->_isDatePickerWheelScrolled;
}

- (void)setIsDatePickerWheelScrolled:(BOOL)a3
{
  self->_isDatePickerWheelScrolled = a3;
}

- (NSDateComponents)currentDatePickerTimeComponents
{
  return self->_currentDatePickerTimeComponents;
}

- (void)setCurrentDatePickerTimeComponents:(id)a3
{
  objc_storeStrong((id *)&self->_currentDatePickerTimeComponents, a3);
}

- (HMRoom)selectedRoom
{
  return self->_selectedRoom;
}

- (void)setSelectedRoom:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRoom, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectedRoom, 0);
  objc_storeStrong((id *)&self->_currentDatePickerTimeComponents, 0);
  objc_storeStrong((id *)&self->_appleMusicSubcriptionResult, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_artworkFetchTask, 0);
  objc_storeStrong((id *)&self->_hfPlaybackArchive, 0);
  objc_storeStrong((id *)&self->_editedAlarm, 0);
  objc_storeStrong((id *)&self->_originalAlarm, 0);
  objc_storeStrong((id *)&self->_editAlarmView, 0);
  objc_storeStrong((id *)&self->_selectedActionSets, 0);
  objc_storeStrong((id *)&self->_loggedInAppleMusicAccountDSID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
