@implementation AMUIDateTimeViewController

- (AMUIDateTimeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AMUIDateTimeViewController *v4;
  AMUIDateTimeViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMUIDateTimeViewController;
  v4 = -[AMUIDateTimeViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[AMUIDateTimeViewController setDateProvider:](v4, "setDateProvider:", 0);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[AMUIDateTimeViewController _stopUpdateTimer](self, "_stopUpdateTimer");
  v3.receiver = self;
  v3.super_class = (Class)AMUIDateTimeViewController;
  -[AMUIDateTimeViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  AMUIDateTimeView *v8;
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
  BSUIVibrancyEffectView *vibrancyView;
  BSUIVibrancyEffectView *v20;
  AMUIDateTimeView *dateTimeView;
  AMUIDateTimeView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BSUIVibrancyEffectView *v28;
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
  _QWORD v43[10];

  v43[8] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE0BF50]);
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v7 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], v4, v5, v6);
  v8 = -[AMUIDateTimeView initWithFrame:]([AMUIDateTimeView alloc], "initWithFrame:", v3, v4, v5, v6);
  -[AMUIDateTimeView layer](v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsGroupOpacity:", 1);

  objc_msgSend(v7, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v8);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AMUIDateTimeView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v31 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v10, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIDateTimeView leadingAnchor](v8, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v39;
  objc_msgSend(v10, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIDateTimeView trailingAnchor](v8, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v36;
  objc_msgSend(v10, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIDateTimeView topAnchor](v8, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v33;
  objc_msgSend(v10, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIDateTimeView bottomAnchor](v8, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v29;
  objc_msgSend(v7, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v25;
  objc_msgSend(v7, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v11;
  v28 = (BSUIVibrancyEffectView *)v7;
  objc_msgSend(v7, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v14;
  objc_msgSend(v7, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v18);

  vibrancyView = self->_vibrancyView;
  self->_vibrancyView = v28;
  v20 = v28;

  dateTimeView = self->_dateTimeView;
  self->_dateTimeView = v8;
  v22 = v8;

  -[AMUIDateTimeViewController setView:](self, "setView:", self->_vibrancyView);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDateProvider:(id)a3
{
  AMUIDefaultDateProvider *v4;
  void *v5;
  AMUIDefaultDateProvider *obj;

  v4 = (AMUIDefaultDateProvider *)a3;
  if (!v4)
    v4 = objc_alloc_init(AMUIDefaultDateProvider);
  if ((AMUIDefaultDateProvider *)self->_dateProvider != v4)
  {
    obj = v4;
    -[AMUIDateTimeViewController _stopUpdateTimer](self, "_stopUpdateTimer");
    objc_storeStrong((id *)&self->_dateProvider, obj);
    -[AMUIDateProviding date](self->_dateProvider, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIDateTimeViewController _updateViewWithDate:](self, "_updateViewWithDate:", v5);

    v4 = obj;
    if (!self->_disablesUpdates)
    {
      -[AMUIDateTimeViewController _startUpdateTimer](self, "_startUpdateTimer");
      v4 = obj;
    }
  }

}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  -[AMUIDateTimeViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return (BSUIVibrancyConfiguration *)-[BSUIVibrancyEffectView configuration](self->_vibrancyView, "configuration");
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v4;
  AMUIDateTimeView *dateTimeView;
  id v6;

  v4 = a3;
  -[AMUIDateTimeViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[BSUIVibrancyEffectView setConfiguration:](self->_vibrancyView, "setConfiguration:", v4);
  dateTimeView = self->_dateTimeView;
  objc_msgSend(v4, "color");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[AMUIDateTimeView setTextColor:](dateTimeView, "setTextColor:", v6);
}

- (UIView)viewForOpacityAdjustment
{
  return (UIView *)self->_dateTimeView;
}

- (id)_dateTimeViewIfExists
{
  return self->_dateTimeView;
}

- (void)_updateViewWithDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_disablesUpdates)
  {
    -[AMUIDateTimeViewController _stopUpdateTimer](self, "_stopUpdateTimer");
  }
  else
  {
    -[AMUIDateTimeViewController _dateTimeViewIfExists](self, "_dateTimeViewIfExists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDate:", v5);

    -[AMUIDateTimeViewController _startUpdateTimer](self, "_startUpdateTimer");
  }

}

- (void)_startUpdateTimer
{
  AMUIDateProviding *dateProvider;
  void *v4;
  id dateProviderToken;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_dateProviderToken)
  {
    objc_initWeak(&location, self);
    dateProvider = self->_dateProvider;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47__AMUIDateTimeViewController__startUpdateTimer__block_invoke;
    v6[3] = &unk_250763820;
    objc_copyWeak(&v7, &location);
    -[AMUIDateProviding observeMinuteUpdatesWithHandler:](dateProvider, "observeMinuteUpdatesWithHandler:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dateProviderToken = self->_dateProviderToken;
    self->_dateProviderToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __47__AMUIDateTimeViewController__startUpdateTimer__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateViewWithDate:", v3);

}

- (void)_stopUpdateTimer
{
  id dateProviderToken;

  if (self->_dateProviderToken)
  {
    -[AMUIDateProviding removeMinuteUpdateHandler:](self->_dateProvider, "removeMinuteUpdateHandler:");
    dateProviderToken = self->_dateProviderToken;
    self->_dateProviderToken = 0;

  }
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_dateTimeView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong(&self->_dateProviderToken, 0);
}

@end
