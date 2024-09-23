@implementation CharacteristicTypeDetailViewController

- (CharacteristicTypeDetailViewController)initWithHealthStore:(id)a3 characteristicType:(id)a4 identifier:(int64_t)a5 firstName:(id)a6 lastName:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CharacteristicTypeDetailViewController *v17;
  CharacteristicTypeDetailViewController *v18;
  uint64_t v19;
  WDUserDefaults *userDefaults;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CharacteristicTypeDetailViewController;
  v17 = -[CharacteristicTypeDetailViewController initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, 0, 0);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_healthStore, a3);
    objc_storeStrong((id *)&v18->_characteristicType, a4);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0D2F2F0]), "initWithHealthStore:", v13);
    userDefaults = v18->_userDefaults;
    v18->_userDefaults = (WDUserDefaults *)v19;

    v18->_specifierID = a5;
    objc_storeStrong((id *)&v18->_firstName, a6);
    objc_storeStrong((id *)&v18->_lastName, a7);
  }
  -[CharacteristicTypeDetailViewController title](v18, "title");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CharacteristicTypeDetailViewController navigationItem](v18, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTitle:", v21);

  -[CharacteristicTypeDetailViewController navigationItem](v18, "navigationItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setStyle:", 0);

  return v18;
}

- (CharacteristicTypeDetailViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CharacteristicTypeDetailViewController;
  return -[CharacteristicTypeDetailViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (CharacteristicTypeDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    switch(self->_specifierID)
    {
      case 1:
        -[CharacteristicTypeDetailViewController specifierForFirstName](self, "specifierForFirstName");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 2:
        -[CharacteristicTypeDetailViewController specifierForLastName](self, "specifierForLastName");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 3:
        -[CharacteristicTypeDetailViewController specifierForBiologicalSex](self, "specifierForBiologicalSex");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 4:
        -[CharacteristicTypeDetailViewController specifierForBloodType](self, "specifierForBloodType");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 5:
        -[CharacteristicTypeDetailViewController specifierForFitzpatrickSkinType](self, "specifierForFitzpatrickSkinType");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 6:
        -[CharacteristicTypeDetailViewController specifierForWheelchairUse](self, "specifierForWheelchairUse");
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v7 = (void *)v6;
        objc_msgSend(v5, "addObject:", v6);

        break;
      default:
        break;
    }
    v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)specifierForFirstName
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1E55A2388, self, sel_setFirstName_specifier_, sel_getFirstName_, 0, 8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80800]);
  return v2;
}

- (id)specifierForLastName
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1E55A2388, self, sel_setLastName_specifier_, sel_getLastName_, 0, 8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80800]);
  return v2;
}

- (id)specifierForBiologicalSex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t j;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0D804E8];
  HKHealthKitFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BIOLOGICAL_SEX"), &stru_1E55A2388, *MEMORY[0x1E0CB5138]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel_setBiologicalSex_specifier_, sel_getBiologicalSex_, objc_opt_class(), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 4; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 0; j != 4; ++j)
  {
    -[CharacteristicTypeDetailViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_displayStringForBiologicalSex:", j);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObject:", v13);
  }
  objc_msgSend(v6, "setValues:titles:", v7, v10);

  return v6;
}

- (id)specifierForBloodType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t j;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0D804E8];
  HKHealthKitFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BLOOD_TYPE"), &stru_1E55A2388, *MEMORY[0x1E0CB5138]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel_setBloodType_specifier_, sel_getBloodType_, objc_opt_class(), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 9; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 0; j != 9; ++j)
  {
    -[CharacteristicTypeDetailViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_displayStringForBloodType:", j);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObject:", v13);
  }
  objc_msgSend(v6, "setValues:titles:", v7, v10);

  return v6;
}

- (id)specifierForFitzpatrickSkinType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t j;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0D804E8];
  HKHealthKitFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FITZPATRICK_SKIN_TYPE"), &stru_1E55A2388, *MEMORY[0x1E0CB5138]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel_setFitzpatrickSkinType_specifier_, sel_getFitzpatrickSkinType_, objc_opt_class(), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 7; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 0; j != 7; ++j)
  {
    -[CharacteristicTypeDetailViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_displayStringForFitzpatrickSkinType:", j);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObject:", v13);
  }
  objc_msgSend(v6, "setValues:titles:", v7, v10);

  return v6;
}

- (id)specifierForWheelchairUse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t j;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0D804E8];
  HKHealthKitFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WHEELCHAIR_USE"), &stru_1E55A2388, *MEMORY[0x1E0CB5138]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel_setWheelchairUse_specifier_, sel_getWheelchairUse_, objc_opt_class(), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (j = 0; j != 3; ++j)
  {
    -[CharacteristicTypeDetailViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_displayStringForWheelchairUse:", j);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObject:", v13);
  }
  objc_msgSend(v6, "setValues:titles:", v7, v10);

  return v6;
}

- (void)setFirstName:(id)a3 specifier:(id)a4
{
  __CFString *v6;
  id v7;
  NSString *lastName;
  __CFString *v9;
  __CFString *v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  _QWORD v15[5];
  __CFString *v16;
  id v17;

  v6 = (__CFString *)a3;
  v7 = a4;
  lastName = self->_lastName;
  if (v6)
    v9 = v6;
  else
    v9 = &stru_1E55A2388;
  v15[0] = MEMORY[0x1E0C809B0];
  if (lastName)
    v10 = (__CFString *)lastName;
  else
    v10 = &stru_1E55A2388;
  v15[1] = 3221225472;
  v15[2] = __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke;
  v15[3] = &unk_1E55755B8;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v10;
  v14 = v9;
  -[CharacteristicTypeDetailViewController _updateFirstName:lastName:completion:](self, "_updateFirstName:lastName:completion:", v14, v13, v15);

}

void __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke_2;
  block[3] = &unk_1E5575590;
  v12 = a2;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v5;
  v10 = v7;
  v11 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "didUpdateName");

}

void __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1408), *(id *)(a1 + 40));
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke_2_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(a1 + 56));
  }
}

- (id)getFirstName:(id)a3
{
  return self->_firstName;
}

- (void)setLastName:(id)a3 specifier:(id)a4
{
  __CFString *v6;
  id v7;
  __CFString *firstName;
  __CFString *v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  _QWORD v14[5];
  __CFString *v15;
  id v16;

  v6 = (__CFString *)a3;
  v7 = a4;
  if (self->_firstName)
    firstName = (__CFString *)self->_firstName;
  else
    firstName = &stru_1E55A2388;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  if (v6)
    v9 = v6;
  else
    v9 = &stru_1E55A2388;
  v14[2] = __64__CharacteristicTypeDetailViewController_setLastName_specifier___block_invoke;
  v14[3] = &unk_1E55755B8;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v9;
  v13 = firstName;
  -[CharacteristicTypeDetailViewController _updateFirstName:lastName:completion:](self, "_updateFirstName:lastName:completion:", v13, v12, v14);

}

void __64__CharacteristicTypeDetailViewController_setLastName_specifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CharacteristicTypeDetailViewController_setLastName_specifier___block_invoke_2;
  block[3] = &unk_1E5575590;
  v12 = a2;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v5;
  v10 = v7;
  v11 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "didUpdateName");

}

void __64__CharacteristicTypeDetailViewController_setLastName_specifier___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1416), *(id *)(a1 + 40));
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke_2_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(a1 + 56));
  }
}

- (id)getLastName:(id)a3
{
  return self->_lastName;
}

- (void)setBiologicalSex:(id)a3 specifier:(id)a4
{
  HKHealthStore *healthStore;
  int v6;
  id v7;
  HKHealthStore *v8;
  HKBiologicalSexObject *v9;
  id v10;
  HKBiologicalSexObject *biologicalSexObject;
  id v12;
  id v13;

  healthStore = self->_healthStore;
  v13 = 0;
  v6 = -[HKHealthStore _setBiologicalSex:error:](healthStore, "_setBiologicalSex:error:", objc_msgSend(a3, "integerValue"), &v13);
  v7 = v13;
  if (v6)
  {
    v8 = self->_healthStore;
    v12 = v7;
    -[HKHealthStore biologicalSexWithError:](v8, "biologicalSexWithError:", &v12);
    v9 = (HKBiologicalSexObject *)objc_claimAutoreleasedReturnValue();
    v10 = v12;

    biologicalSexObject = self->_biologicalSexObject;
    self->_biologicalSexObject = v9;

    v7 = v10;
  }

}

- (id)getBiologicalSex:(id)a3
{
  HKHealthStore *healthStore;
  HKBiologicalSexObject *v5;
  id v6;
  HKBiologicalSexObject *biologicalSexObject;
  void *v8;
  HKBiologicalSex v9;
  id v11;

  healthStore = self->_healthStore;
  v11 = 0;
  -[HKHealthStore biologicalSexWithError:](healthStore, "biologicalSexWithError:", &v11);
  v5 = (HKBiologicalSexObject *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  biologicalSexObject = self->_biologicalSexObject;
  self->_biologicalSexObject = v5;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = -[HKBiologicalSexObject biologicalSex](self->_biologicalSexObject, "biologicalSex");

  objc_msgSend(v8, "numberWithInteger:", v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setBloodType:(id)a3 specifier:(id)a4
{
  HKHealthStore *healthStore;
  int v6;
  id v7;
  HKHealthStore *v8;
  HKBloodTypeObject *v9;
  id v10;
  HKBloodTypeObject *bloodTypeObject;
  id v12;
  id v13;

  healthStore = self->_healthStore;
  v13 = 0;
  v6 = -[HKHealthStore _setBloodType:error:](healthStore, "_setBloodType:error:", objc_msgSend(a3, "integerValue"), &v13);
  v7 = v13;
  if (v6)
  {
    v8 = self->_healthStore;
    v12 = v7;
    -[HKHealthStore bloodTypeWithError:](v8, "bloodTypeWithError:", &v12);
    v9 = (HKBloodTypeObject *)objc_claimAutoreleasedReturnValue();
    v10 = v12;

    bloodTypeObject = self->_bloodTypeObject;
    self->_bloodTypeObject = v9;

    v7 = v10;
  }

}

- (id)getBloodType:(id)a3
{
  HKHealthStore *healthStore;
  HKBloodTypeObject *v5;
  id v6;
  HKBloodTypeObject *bloodTypeObject;
  void *v8;
  HKBloodType v9;
  id v11;

  healthStore = self->_healthStore;
  v11 = 0;
  -[HKHealthStore bloodTypeWithError:](healthStore, "bloodTypeWithError:", &v11);
  v5 = (HKBloodTypeObject *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  bloodTypeObject = self->_bloodTypeObject;
  self->_bloodTypeObject = v5;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = -[HKBloodTypeObject bloodType](self->_bloodTypeObject, "bloodType");

  objc_msgSend(v8, "numberWithInteger:", v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setFitzpatrickSkinType:(id)a3 specifier:(id)a4
{
  HKHealthStore *healthStore;
  int v6;
  id v7;
  HKHealthStore *v8;
  HKFitzpatrickSkinTypeObject *v9;
  id v10;
  HKFitzpatrickSkinTypeObject *fitzpatrickSkinTypeObject;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;

  healthStore = self->_healthStore;
  v20 = 0;
  v6 = -[HKHealthStore _setFitzpatrickSkinType:error:](healthStore, "_setFitzpatrickSkinType:error:", objc_msgSend(a3, "integerValue"), &v20);
  v7 = v20;
  if (v6)
  {
    v8 = self->_healthStore;
    v19 = v7;
    -[HKHealthStore fitzpatrickSkinTypeWithError:](v8, "fitzpatrickSkinTypeWithError:", &v19);
    v9 = (HKFitzpatrickSkinTypeObject *)objc_claimAutoreleasedReturnValue();
    v10 = v19;

    fitzpatrickSkinTypeObject = self->_fitzpatrickSkinTypeObject;
    self->_fitzpatrickSkinTypeObject = v9;

    v7 = v10;
  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      -[CharacteristicTypeDetailViewController setFitzpatrickSkinType:specifier:].cold.1((uint64_t)v7, v12, v13, v14, v15, v16, v17, v18);
  }

}

- (id)getFitzpatrickSkinType:(id)a3
{
  HKHealthStore *healthStore;
  HKFitzpatrickSkinTypeObject *v5;
  id v6;
  HKFitzpatrickSkinTypeObject *fitzpatrickSkinTypeObject;
  void *v8;
  HKFitzpatrickSkinType v9;
  id v11;

  healthStore = self->_healthStore;
  v11 = 0;
  -[HKHealthStore fitzpatrickSkinTypeWithError:](healthStore, "fitzpatrickSkinTypeWithError:", &v11);
  v5 = (HKFitzpatrickSkinTypeObject *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  fitzpatrickSkinTypeObject = self->_fitzpatrickSkinTypeObject;
  self->_fitzpatrickSkinTypeObject = v5;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = -[HKFitzpatrickSkinTypeObject skinType](self->_fitzpatrickSkinTypeObject, "skinType");

  objc_msgSend(v8, "numberWithInteger:", v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setWheelchairUse:(id)a3 specifier:(id)a4
{
  HKHealthStore *healthStore;
  int v6;
  id v7;
  HKHealthStore *v8;
  HKWheelchairUseObject *v9;
  id v10;
  HKWheelchairUseObject *wheelchairUseObject;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;

  healthStore = self->_healthStore;
  v20 = 0;
  v6 = -[HKHealthStore _setWheelchairUse:error:](healthStore, "_setWheelchairUse:error:", objc_msgSend(a3, "integerValue"), &v20);
  v7 = v20;
  if (v6)
  {
    v8 = self->_healthStore;
    v19 = v7;
    -[HKHealthStore wheelchairUseWithError:](v8, "wheelchairUseWithError:", &v19);
    v9 = (HKWheelchairUseObject *)objc_claimAutoreleasedReturnValue();
    v10 = v19;

    wheelchairUseObject = self->_wheelchairUseObject;
    self->_wheelchairUseObject = v9;

    v7 = v10;
  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      -[CharacteristicTypeDetailViewController setWheelchairUse:specifier:].cold.1((uint64_t)v7, v12, v13, v14, v15, v16, v17, v18);
  }

}

- (id)getWheelchairUse:(id)a3
{
  HKHealthStore *healthStore;
  HKWheelchairUseObject *v5;
  id v6;
  HKWheelchairUseObject *wheelchairUseObject;
  void *v8;
  HKWheelchairUse v9;
  id v11;

  healthStore = self->_healthStore;
  v11 = 0;
  -[HKHealthStore wheelchairUseWithError:](healthStore, "wheelchairUseWithError:", &v11);
  v5 = (HKWheelchairUseObject *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  wheelchairUseObject = self->_wheelchairUseObject;
  self->_wheelchairUseObject = v5;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = -[HKWheelchairUseObject wheelchairUse](self->_wheelchairUseObject, "wheelchairUse");

  objc_msgSend(v8, "numberWithInteger:", v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CharacteristicTypeDetailViewController;
  -[CharacteristicTypeDetailViewController tableView:cellForRowAtIndexPath:](&v7, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "tag") == 8)
  {
    objc_msgSend(v4, "editableTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAutocapitalizationType:", 2);
    objc_msgSend(v5, "setAutocorrectionType:", 1);
    objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v5, "setTextAlignment:", 4);
    objc_msgSend(v5, "setReturnKeyType:", 9);
    objc_msgSend(v5, "setClearButtonMode:", 3);

  }
  return v4;
}

- (void)_updateFirstName:(id)a3 lastName:(id)a4 completion:(id)a5
{
  HKHealthStore *healthStore;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  healthStore = self->_healthStore;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[HKHealthStore profileIdentifier](healthStore, "profileIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type");

  if (v13 == 1)
  {
    v14 = *MEMORY[0x1E0CB7810];
    v17[0] = *MEMORY[0x1E0CB7808];
    v17[1] = v14;
    v18[0] = v11;
    v18[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDUserDefaults setValue:forKey:completion:](self->_userDefaults, "setValue:forKey:completion:", v15, *MEMORY[0x1E0CB7820], v9);

  }
  else
  {
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6A18]), "initWithHealthStore:", self->_healthStore);
    objc_msgSend(v16, "setDisplayFirstName:lastName:completion:", v11, v10, v9);

  }
}

- (void)didUpdateName
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x1E0CB7818], 0);

}

- (CharacteristicTypeDetailViewControllerDelegate)delegate
{
  return (CharacteristicTypeDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wheelchairUseObject, 0);
  objc_storeStrong((id *)&self->_fitzpatrickSkinTypeObject, 0);
  objc_storeStrong((id *)&self->_biologicalSexObject, 0);
  objc_storeStrong((id *)&self->_bloodTypeObject, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __65__CharacteristicTypeDetailViewController_setFirstName_specifier___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1A95F5000, v0, v1, "Error setting name to %@: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setFitzpatrickSkinType:(uint64_t)a3 specifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A95F5000, a2, a3, "Error setting Fitzpatrick skin type: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)setWheelchairUse:(uint64_t)a3 specifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A95F5000, a2, a3, "Error setting wheelchair use: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
