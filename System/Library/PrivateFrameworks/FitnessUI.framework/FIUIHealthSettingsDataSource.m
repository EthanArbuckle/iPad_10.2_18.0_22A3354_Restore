@implementation FIUIHealthSettingsDataSource

- (FIUIHealthSettingsDataSource)initWithActivitySettingsController:(id)a3 showWheelchair:(BOOL)a4 pregnancyStateProvider:(id)a5 showPregnancy:(BOOL)a6
{
  id v11;
  id v12;
  FIUIHealthSettingsDataSource *v13;
  FIUIHealthSettingsDataSource *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v11 = a3;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)FIUIHealthSettingsDataSource;
  v13 = -[FIUIHealthSettingsDataSource init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_settingsController, a3);
    objc_initWeak(&location, v14);
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __119__FIUIHealthSettingsDataSource_initWithActivitySettingsController_showWheelchair_pregnancyStateProvider_showPregnancy___block_invoke;
    v19 = &unk_24CF30408;
    objc_copyWeak(&v20, &location);
    -[FIActivitySettingsController setUpdateHandler:](v14->_settingsController, "setUpdateHandler:", &v16);
    v14->_showWheelchair = a4;
    objc_storeStrong((id *)&v14->_pregnancyStateProvider, a5);
    v14->_showPregnancy = a6;
    -[FIUIPregnancyStateProvider addObserver:](v14->_pregnancyStateProvider, "addObserver:", v14, v16, v17, v18, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __119__FIUIHealthSettingsDataSource_initWithActivitySettingsController_showWheelchair_pregnancyStateProvider_showPregnancy___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCells");

}

- (FIUIHealthSettingsDataSource)initWithActivitySettingsController:(id)a3 showWheelchair:(BOOL)a4
{
  id v7;
  FIUIHealthSettingsDataSource *v8;
  FIUIHealthSettingsDataSource *v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FIUIHealthSettingsDataSource;
  v8 = -[FIUIHealthSettingsDataSource init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_settingsController, a3);
    objc_initWeak(&location, v9);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __82__FIUIHealthSettingsDataSource_initWithActivitySettingsController_showWheelchair___block_invoke;
    v11[3] = &unk_24CF30408;
    objc_copyWeak(&v12, &location);
    -[FIActivitySettingsController setUpdateHandler:](v9->_settingsController, "setUpdateHandler:", v11);
    v9->_showWheelchair = a4;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __82__FIUIHealthSettingsDataSource_initWithActivitySettingsController_showWheelchair___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCells");

}

- (id)birthDateCell
{
  FIUIHealthSettingsTableViewCell *v3;
  FIUIHealthSettingsTableViewCell *birthDateCell;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (!self->_birthDateCell)
  {
    v3 = -[FIUIHealthSettingsTableViewCell initWithStyle:reuseIdentifier:]([FIUIHealthSettingsTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    birthDateCell = self->_birthDateCell;
    self->_birthDateCell = v3;

    FIUIBundle(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BIRTHDATE"), &stru_24CF339D8, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsTableViewCell textLabel](self->_birthDateCell, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[FIUIHealthSettingsDataSource birthDatePickerController](self, "birthDatePickerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "datePickerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FIUIHostingAreaLayoutView blackBackgroundViewHostingView:](FIUIHostingAreaLayoutView, "blackBackgroundViewHostingView:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[FIUIHealthSettingsTableViewCell setInputView:](self->_birthDateCell, "setInputView:", v11);
    -[FIUIHealthSettingsDataSource birthDatePickerController](self, "birthDatePickerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsTableViewCell setForceUpdatable:](self->_birthDateCell, "setForceUpdatable:", v12);

  }
  -[FIUIHealthSettingsDataSource _updateBirthDateCell](self, "_updateBirthDateCell");
  return self->_birthDateCell;
}

- (id)biologicalSexCell
{
  FIUIHealthSettingsTableViewCell *v3;
  FIUIHealthSettingsTableViewCell *biologicalSexCell;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (!self->_biologicalSexCell)
  {
    v3 = -[FIUIHealthSettingsTableViewCell initWithStyle:reuseIdentifier:]([FIUIHealthSettingsTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    biologicalSexCell = self->_biologicalSexCell;
    self->_biologicalSexCell = v3;

    FIUIBundle(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BIOLOGICAL_SEX"), &stru_24CF339D8, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsTableViewCell textLabel](self->_biologicalSexCell, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[FIUIHealthSettingsDataSource sexPickerController](self, "sexPickerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pickerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FIUIHostingAreaLayoutView blackBackgroundViewHostingView:](FIUIHostingAreaLayoutView, "blackBackgroundViewHostingView:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[FIUIHealthSettingsTableViewCell setInputView:](self->_biologicalSexCell, "setInputView:", v11);
    -[FIUIHealthSettingsDataSource sexPickerController](self, "sexPickerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsTableViewCell setForceUpdatable:](self->_biologicalSexCell, "setForceUpdatable:", v12);

  }
  -[FIUIHealthSettingsDataSource _updateBiologicalSexCell](self, "_updateBiologicalSexCell");
  return self->_biologicalSexCell;
}

- (id)heightCell
{
  FIUIHealthSettingsTableViewCell *v3;
  FIUIHealthSettingsTableViewCell *heightCell;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (!self->_heightCell)
  {
    v3 = -[FIUIHealthSettingsTableViewCell initWithStyle:reuseIdentifier:]([FIUIHealthSettingsTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    heightCell = self->_heightCell;
    self->_heightCell = v3;

    FIUIBundle(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("HEIGHT"), &stru_24CF339D8, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsTableViewCell textLabel](self->_heightCell, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[FIUIHealthSettingsDataSource heightPickerController](self, "heightPickerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pickerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FIUIHostingAreaLayoutView blackBackgroundViewHostingView:](FIUIHostingAreaLayoutView, "blackBackgroundViewHostingView:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[FIUIHealthSettingsTableViewCell setInputView:](self->_heightCell, "setInputView:", v11);
    -[FIUIHealthSettingsDataSource heightPickerController](self, "heightPickerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsTableViewCell setForceUpdatable:](self->_heightCell, "setForceUpdatable:", v12);

  }
  -[FIUIHealthSettingsDataSource _updateHeightCell](self, "_updateHeightCell");
  return self->_heightCell;
}

- (id)weightCell
{
  FIUIHealthSettingsTableViewCell *v3;
  FIUIHealthSettingsTableViewCell *weightCell;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (!self->_weightCell)
  {
    v3 = -[FIUIHealthSettingsTableViewCell initWithStyle:reuseIdentifier:]([FIUIHealthSettingsTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    weightCell = self->_weightCell;
    self->_weightCell = v3;

    FIUIBundle(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("WEIGHT"), &stru_24CF339D8, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsTableViewCell textLabel](self->_weightCell, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[FIUIHealthSettingsDataSource weightPickerController](self, "weightPickerController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pickerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[FIUIHostingAreaLayoutView blackBackgroundViewHostingView:](FIUIHostingAreaLayoutView, "blackBackgroundViewHostingView:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[FIUIHealthSettingsTableViewCell setInputView:](self->_weightCell, "setInputView:", v11);
    -[FIUIHealthSettingsDataSource weightPickerController](self, "weightPickerController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsTableViewCell setForceUpdatable:](self->_weightCell, "setForceUpdatable:", v12);

  }
  -[FIUIHealthSettingsDataSource _updateWeightCell](self, "_updateWeightCell");
  return self->_weightCell;
}

- (id)wheelchairUseCell
{
  FIUIHealthSettingsTableViewCell *wheelchairUseCell;
  FIUIHealthSettingsTableViewCell *v4;
  FIUIHealthSettingsTableViewCell *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  wheelchairUseCell = self->_wheelchairUseCell;
  if (!wheelchairUseCell)
  {
    v4 = -[FIUIHealthSettingsTableViewCell initWithStyle:reuseIdentifier:]([FIUIHealthSettingsTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    v5 = self->_wheelchairUseCell;
    self->_wheelchairUseCell = v4;

    FIUIBundle(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WHEELCHAIR_USE"), &stru_24CF339D8, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsTableViewCell textLabel](self->_wheelchairUseCell, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    v10 = objc_alloc_init(MEMORY[0x24BEBD9B8]);
    objc_msgSend(v10, "setOn:", -[FIActivitySettingsController wheelchairUse](self->_settingsController, "wheelchairUse") == 2);
    objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_wheelchairSwitchDidChange_, 4096);
    -[FIUIHealthSettingsTableViewCell setAccessoryView:](self->_wheelchairUseCell, "setAccessoryView:", v10);

    wheelchairUseCell = self->_wheelchairUseCell;
  }
  return wheelchairUseCell;
}

- (id)pregnancyStateCell
{
  FIUIHealthSettingsTableViewCell *pregnancyStateCell;
  FIUIHealthSettingsTableViewCell *v4;
  FIUIHealthSettingsTableViewCell *v5;
  void *v6;

  pregnancyStateCell = self->_pregnancyStateCell;
  if (!pregnancyStateCell)
  {
    v4 = -[FIUIHealthSettingsTableViewCell initWithStyle:reuseIdentifier:]([FIUIHealthSettingsTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
    v5 = self->_pregnancyStateCell;
    self->_pregnancyStateCell = v4;

    -[FIUIPregnancyStateProvider currentModel](self->_pregnancyStateProvider, "currentModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsDataSource _configurePregnancyStateCellForModel:](self, "_configurePregnancyStateCellForModel:", v6);

    pregnancyStateCell = self->_pregnancyStateCell;
  }
  return pregnancyStateCell;
}

- (void)_updateCells
{
  -[FIUIHealthSettingsDataSource _updateHeightCell](self, "_updateHeightCell");
  -[FIUIHealthSettingsDataSource _updateWeightCell](self, "_updateWeightCell");
  -[FIUIHealthSettingsDataSource _updateBirthDateCell](self, "_updateBirthDateCell");
  -[FIUIHealthSettingsDataSource _updateBiologicalSexCell](self, "_updateBiologicalSexCell");
}

- (void)_updateHeightCell
{
  void *v3;
  void *v4;
  id v5;

  -[FIActivitySettingsController height](self->_settingsController, "height");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  FIUIHeightDisplayString(v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIHealthSettingsTableViewCell detailTextLabel](self->_heightCell, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

}

- (void)_updateWeightCell
{
  void *v3;
  void *v4;
  id v5;

  -[FIActivitySettingsController weight](self->_settingsController, "weight");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  FIUIWeightDisplayString(v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIHealthSettingsTableViewCell detailTextLabel](self->_weightCell, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

}

- (void)_updateBirthDateCell
{
  void *v3;
  void *v4;
  id v5;

  -[FIActivitySettingsController dateOfBirth](self->_settingsController, "dateOfBirth");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  FIUIDateOfBirthDisplayString(v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIHealthSettingsTableViewCell detailTextLabel](self->_birthDateCell, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

}

- (void)_updateBiologicalSexCell
{
  void *v3;
  id v4;

  FIUIBiologicalSexDisplayString(-[FIActivitySettingsController biologicalSex](self->_settingsController, "biologicalSex"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUIHealthSettingsTableViewCell detailTextLabel](self->_biologicalSexCell, "detailTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

}

- (void)_updatePregnancyStateCellWithModel:(id)a3
{
  id WeakRetained;

  -[FIUIHealthSettingsDataSource _configurePregnancyStateCellForModel:](self, "_configurePregnancyStateCellForModel:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "shouldReloadPregnancySection");

}

- (void)_configurePregnancyStateCellForModel:(id)a3
{
  FIUIHealthSettingsTableViewCell *pregnancyStateCell;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  _BOOL8 v14;
  const __CFString *v15;
  __CFString **v16;
  void *v17;
  id v18;

  pregnancyStateCell = self->_pregnancyStateCell;
  v5 = a3;
  -[FIUIHealthSettingsTableViewCell defaultContentConfiguration](pregnancyStateCell, "defaultContentConfiguration");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE01CA8], "keyColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nonGradientTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v7);

  v9 = objc_msgSend(v5, "state");
  FIUIBundle(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v9 == 1;
  v14 = v9 == 1;
  if (v13)
    v15 = CFSTR("EDIT_PREGNANCY_BUTTON");
  else
    v15 = CFSTR("ADD_PREGNANCY_BUTTON");
  if (v13)
    v16 = FIUIEditPregnancyAccessibilityIdentifier;
  else
    v16 = FIUIAddPregnancyAccessibilityIdentifier;
  objc_msgSend(v11, "localizedStringForKey:value:table:", v15, &stru_24CF339D8, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v17);

  -[FIUIHealthSettingsTableViewCell setAccessoryType:](self->_pregnancyStateCell, "setAccessoryType:", v14);
  -[FIUIHealthSettingsTableViewCell setAccessibilityIdentifier:](self->_pregnancyStateCell, "setAccessibilityIdentifier:", *v16);
  -[FIUIHealthSettingsTableViewCell setContentConfiguration:](self->_pregnancyStateCell, "setContentConfiguration:", v18);

}

- (FIUIHealthSettingsHeightPickerController)heightPickerController
{
  FIUIHealthSettingsHeightPickerController *heightPickerController;
  FIUIHealthSettingsHeightPickerController *v4;
  FIUIHealthSettingsHeightPickerController *v5;
  FIUIHealthSettingsHeightPickerController *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;

  heightPickerController = self->_heightPickerController;
  if (!heightPickerController)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc_init(FIUIHealthSettingsHeightPickerController);
    v5 = self->_heightPickerController;
    self->_heightPickerController = v4;

    v6 = self->_heightPickerController;
    v7 = objc_loadWeakRetained(&location);
    objc_msgSend(v7, "settingsController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "height");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsHeightPickerController setHeightQuantity:](v6, "setHeightQuantity:", v9);

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __54__FIUIHealthSettingsDataSource_heightPickerController__block_invoke;
    v11[3] = &unk_24CF315F8;
    objc_copyWeak(&v12, &location);
    -[FIUIHealthSettingsHeightPickerController setHeightUpdateHandler:](self->_heightPickerController, "setHeightUpdateHandler:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    heightPickerController = self->_heightPickerController;
  }
  return heightPickerController;
}

void __54__FIUIHealthSettingsDataSource_heightPickerController__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "settingsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeight:", v3);

}

- (FIUIHealthSettingsBirthDatePickerController)birthDatePickerController
{
  FIUIHealthSettingsBirthDatePickerController *birthDatePickerController;
  FIUIHealthSettingsBirthDatePickerController *v4;
  FIUIHealthSettingsBirthDatePickerController *v5;
  FIUIHealthSettingsBirthDatePickerController *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  birthDatePickerController = self->_birthDatePickerController;
  if (!birthDatePickerController)
  {
    v4 = objc_alloc_init(FIUIHealthSettingsBirthDatePickerController);
    v5 = self->_birthDatePickerController;
    self->_birthDatePickerController = v4;

    v6 = self->_birthDatePickerController;
    -[FIActivitySettingsController dateOfBirth](self->_settingsController, "dateOfBirth");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsBirthDatePickerController setDateOfBirth:](v6, "setDateOfBirth:", v7);

    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __57__FIUIHealthSettingsDataSource_birthDatePickerController__block_invoke;
    v9[3] = &unk_24CF304C0;
    objc_copyWeak(&v10, &location);
    -[FIUIHealthSettingsBirthDatePickerController setDateOfBirthUpdateHandler:](self->_birthDatePickerController, "setDateOfBirthUpdateHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    birthDatePickerController = self->_birthDatePickerController;
  }
  return birthDatePickerController;
}

void __57__FIUIHealthSettingsDataSource_birthDatePickerController__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "settingsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateOfBirth:", v3);

}

- (FIUIHealthSettingsWeightPickerController)weightPickerController
{
  FIUIHealthSettingsWeightPickerController *weightPickerController;
  FIUIHealthSettingsWeightPickerController *v4;
  FIUIHealthSettingsWeightPickerController *v5;
  FIUIHealthSettingsWeightPickerController *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;

  weightPickerController = self->_weightPickerController;
  if (!weightPickerController)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc_init(FIUIHealthSettingsWeightPickerController);
    v5 = self->_weightPickerController;
    self->_weightPickerController = v4;

    v6 = self->_weightPickerController;
    v7 = objc_loadWeakRetained(&location);
    objc_msgSend(v7, "settingsController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "weight");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIHealthSettingsWeightPickerController setWeightQuantity:](v6, "setWeightQuantity:", v9);

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __54__FIUIHealthSettingsDataSource_weightPickerController__block_invoke;
    v11[3] = &unk_24CF315F8;
    objc_copyWeak(&v12, &location);
    -[FIUIHealthSettingsWeightPickerController setWeightUpdateHandler:](self->_weightPickerController, "setWeightUpdateHandler:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    weightPickerController = self->_weightPickerController;
  }
  return weightPickerController;
}

void __54__FIUIHealthSettingsDataSource_weightPickerController__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "settingsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWeight:", v3);

}

- (FIUIHealthSettingsSexPickerController)sexPickerController
{
  FIUIHealthSettingsSexPickerController *sexPickerController;
  FIUIHealthSettingsSexPickerController *v4;
  FIUIHealthSettingsSexPickerController *v5;
  _QWORD v7[4];
  id v8;
  id location;

  sexPickerController = self->_sexPickerController;
  if (!sexPickerController)
  {
    v4 = objc_alloc_init(FIUIHealthSettingsSexPickerController);
    v5 = self->_sexPickerController;
    self->_sexPickerController = v4;

    -[FIUIHealthSettingsSexPickerController setBiologicalSex:](self->_sexPickerController, "setBiologicalSex:", -[FIActivitySettingsController biologicalSex](self->_settingsController, "biologicalSex"));
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__FIUIHealthSettingsDataSource_sexPickerController__block_invoke;
    v7[3] = &unk_24CF31620;
    objc_copyWeak(&v8, &location);
    -[FIUIHealthSettingsSexPickerController setSexUpdateHandler:](self->_sexPickerController, "setSexUpdateHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    sexPickerController = self->_sexPickerController;
  }
  return sexPickerController;
}

void __51__FIUIHealthSettingsDataSource_sexPickerController__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "settingsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBiologicalSex:", a2);

}

- (void)wheelchairSwitchDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;

  v4 = objc_msgSend(a3, "isOn");
  if ((_DWORD)v4)
    v5 = 2;
  else
    v5 = 1;
  -[FIActivitySettingsController setWheelchairUse:](self->_settingsController, "setWheelchairUse:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "wheelchairUseSwitchDidChangeTo:", v4);

}

- (void)cellDidBecomeFirstResponder:(id)a3
{
  id v3;

  objc_msgSend(a3, "forceUpdatable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUpdate");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
  {
    if (a4 == 2)
      return self->_showPregnancy;
    else
      return a4 == 1 && self->_showWheelchair;
  }
  else
  {
    return 4;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  if (!objc_msgSend(v5, "section"))
  {
    switch(objc_msgSend(v5, "row"))
    {
      case 0:
        -[FIUIHealthSettingsDataSource birthDateCell](self, "birthDateCell");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 1:
        -[FIUIHealthSettingsDataSource biologicalSexCell](self, "biologicalSexCell");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 2:
        -[FIUIHealthSettingsDataSource heightCell](self, "heightCell");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 3:
        -[FIUIHealthSettingsDataSource weightCell](self, "weightCell");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      default:
        goto LABEL_9;
    }
  }
  if (objc_msgSend(v5, "section") == 1)
  {
    if (!objc_msgSend(v5, "row"))
    {
      -[FIUIHealthSettingsDataSource wheelchairUseCell](self, "wheelchairUseCell");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v7 = (void *)v6;
      goto LABEL_15;
    }
  }
  else if (objc_msgSend(v5, "section") == 2 && !objc_msgSend(v5, "row"))
  {
    -[FIUIHealthSettingsDataSource pregnancyStateCell](self, "pregnancyStateCell");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_9:
  v7 = 0;
LABEL_15:

  return v7;
}

- (int64_t)wheelchairSectionIndex
{
  return 1;
}

- (id)pregnancySectionIndexPath
{
  return (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 2);
}

- (BOOL)shouldHighlightRowAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "section"))
  {
    v5 = objc_msgSend(v4, "section");
    -[FIUIHealthSettingsDataSource pregnancySectionIndexPath](self, "pregnancySectionIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == objc_msgSend(v6, "section");

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)shouldBypassFirstResponderAction:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(a3, "section");
  -[FIUIHealthSettingsDataSource pregnancySectionIndexPath](self, "pregnancySectionIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v4 == objc_msgSend(v5, "section");

  return v4;
}

- (void)startEditing
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21307C000, log, OS_LOG_TYPE_ERROR, "[HealthSettings] Starting editing with non-nil editing settings controller (out of sync start/end edit calls)", v1, 2u);
}

- (void)endEditingAndDiscardChanges:(BOOL)a3
{
  FIActivitySettingsController *preEditSettingsController;

  if (a3)
  {
    objc_storeStrong((id *)&self->_settingsController, self->_preEditSettingsController);
    -[FIUIHealthSettingsDataSource _updateCells](self, "_updateCells");
  }
  preEditSettingsController = self->_preEditSettingsController;
  self->_preEditSettingsController = 0;

}

- (FIActivitySettingsController)editedSettingsController
{
  return self->_settingsController;
}

- (void)pregnancyModelDidChangeWithProvider:(id)a3 model:(id)a4
{
  -[FIUIHealthSettingsDataSource _updatePregnancyStateCellWithModel:](self, "_updatePregnancyStateCellWithModel:", a4);
}

- (FIUIHealthSettingsDataSourceDelegate)delegate
{
  return (FIUIHealthSettingsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FIActivitySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsController, a3);
}

- (void)setBirthDatePickerController:(id)a3
{
  objc_storeStrong((id *)&self->_birthDatePickerController, a3);
}

- (void)setHeightPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_heightPickerController, a3);
}

- (void)setWeightPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_weightPickerController, a3);
}

- (void)setSexPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_sexPickerController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sexPickerController, 0);
  objc_storeStrong((id *)&self->_weightPickerController, 0);
  objc_storeStrong((id *)&self->_heightPickerController, 0);
  objc_storeStrong((id *)&self->_birthDatePickerController, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pregnancyStateProvider, 0);
  objc_storeStrong((id *)&self->_pregnancyStateCell, 0);
  objc_storeStrong((id *)&self->_preEditSettingsController, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCell, 0);
  objc_storeStrong((id *)&self->_weightCell, 0);
  objc_storeStrong((id *)&self->_heightCell, 0);
  objc_storeStrong((id *)&self->_biologicalSexCell, 0);
  objc_storeStrong((id *)&self->_birthDateCell, 0);
}

@end
