@implementation HKDataMetadataViewAllQuantitySeriesSection

- (HKDataMetadataViewAllQuantitySeriesSection)initWithSample:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HKDataMetadataViewAllQuantitySeriesSection *v10;
  HKDataMetadataViewAllQuantitySeriesSection *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("QUANTITY_SERIES_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)HKDataMetadataViewAllQuantitySeriesSection;
  v10 = -[HKDataMetadataSimpleSection initWithTitle:](&v13, sel_initWithTitle_, v9);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[HKDataMetadataViewAllQuantitySeriesSection setSample:](v10, "setSample:", v6),
        -[HKDataMetadataViewAllQuantitySeriesSection setDelegate:](v10, "setDelegate:", v7),
        objc_msgSend(v6, "count") >= 2))
  {
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
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

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("viewAllQuantityCell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("viewAllQuantityCell"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("VIEW_ALL_QUANTITY_SERIES_BUTTON"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v4, "setAccessoryType:", 1);
  objc_msgSend(v4, "setSelectionStyle:", 3);
  return v4;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  id v6;
  HKQuantitySeriesDataProvider *v7;
  void *v8;
  void *v9;
  void *v10;
  HKQuantitySeriesDataProvider *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HKQuantitySeriesViewController *v16;

  v6 = a4;
  v16 = objc_alloc_init(HKQuantitySeriesViewController);
  v7 = [HKQuantitySeriesDataProvider alloc];
  -[HKDataMetadataViewAllQuantitySeriesSection sample](self, "sample");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataViewAllQuantitySeriesSection delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "healthStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKQuantitySeriesDataProvider initWithSample:healthStore:](v7, "initWithSample:healthStore:", v8, v10);

  -[HKDataMetadataViewAllQuantitySeriesSection delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unitController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantitySeriesDataProvider setUnitController:](v11, "setUnitController:", v13);

  -[HKDataMetadataViewAllQuantitySeriesSection delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayTypeController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantitySeriesDataProvider setDisplayTypeController:](v11, "setDisplayTypeController:", v15);

  -[HKQuantitySeriesDataProvider setDelegate:](v11, "setDelegate:", self);
  -[HKQuantitySeriesViewController setDataProvider:](v16, "setDataProvider:", v11);
  objc_msgSend(v6, "pushViewController:animated:", v16, 1);

}

- (void)reloadSampleData
{
  void *v3;
  void (**v4)(id, void *);

  -[HKDataMetadataViewAllQuantitySeriesSection reloadMetaDataVC](self, "reloadMetaDataVC");
  v4 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataViewAllQuantitySeriesSection sample](self, "sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v3);

}

- (id)reloadMetaDataVC
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setReloadMetaDataVC:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (HKSample)sample
{
  return (HKSample *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSample:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (HKDataMetadataViewControllerDelegate)delegate
{
  return (HKDataMetadataViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong(&self->_reloadMetaDataVC, 0);
}

@end
