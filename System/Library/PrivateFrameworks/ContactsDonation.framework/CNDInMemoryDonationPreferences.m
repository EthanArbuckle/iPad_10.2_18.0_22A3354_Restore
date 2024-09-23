@implementation CNDInMemoryDonationPreferences

+ (id)observableWithPreferences:(id)a3 notificationCenter:(id)a4 schedulerProvider:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)MEMORY[0x24BE192A0];
  v9 = a5;
  objc_msgSend(v8, "observableOnNotificationCenter:withName:object:", a4, CFSTR("CNDDonationsEnabledPreferencesKey"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "startWith:scheduler:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __97__CNDInMemoryDonationPreferences_observableWithPreferences_notificationCenter_schedulerProvider___block_invoke;
  v19[3] = &unk_24C2366F8;
  v20 = v7;
  v15 = v7;
  objc_msgSend(v14, "map:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "distinctUntilChanged");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __97__CNDInMemoryDonationPreferences_observableWithPreferences_notificationCenter_schedulerProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isDonationsEnabled"));
}

- (BOOL)isDonationsEnabled
{
  return self->_donationsEnabled;
}

- (void)setDonationsEnabled:(BOOL)a3
{
  self->_donationsEnabled = a3;
}

@end
