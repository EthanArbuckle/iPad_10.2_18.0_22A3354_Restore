@implementation HKDataMetadataBeatToBeatSection

- (HKDataMetadataBeatToBeatSection)initWithSample:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKDataMetadataBeatToBeatSection *v15;
  HKDataMetadataBeatToBeatSection *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKDataMetadataBeatToBeatSection;
  v15 = -[HKDataMetadataBeatToBeatSection init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sample, a3);
    objc_storeStrong((id *)&v16->_healthStore, a4);
    objc_storeStrong((id *)&v16->_displayTypeController, a5);
    objc_storeStrong((id *)&v16->_unitController, a6);
  }

  return v16;
}

- (id)sectionTitle
{
  return 0;
}

- (unint64_t)numberOfRowsInSection
{
  return 1;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BEAT_TO_BEAT_MEASUREMENTS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v4, "setAccessoryType:", 1);
  return v4;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  HKBeatToBeatViewController *v7;
  HKBeatToBeatViewController *v8;
  id v9;

  v5 = a5;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[HKBeatToBeatViewController initWithHeartbeatSeriesSample:healthStore:displayTypeController:unitController:]([HKBeatToBeatViewController alloc], "initWithHeartbeatSeriesSample:healthStore:displayTypeController:unitController:", self->_sample, self->_healthStore, self->_displayTypeController, self->_unitController);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    v7 = -[HKBeatToBeatViewController initWithHRVSample:healthStore:displayTypeController:unitController:]([HKBeatToBeatViewController alloc], "initWithHRVSample:healthStore:displayTypeController:unitController:", self->_sample, self->_healthStore, self->_displayTypeController, self->_unitController);
  }
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v9, "pushViewController:animated:", v7, v5);

  }
LABEL_7:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
