@implementation CNDDonationPreferences

- (CNDDonationPreferences)init
{
  void *v3;
  void *v4;
  void *v5;
  CNDDonationPreferences *v6;
  _QWORD v8[4];
  __CFString *v9;
  _QWORD v10[4];
  __CFString *v11;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNDonationLoggerProvider defaultProvider](CNDonationLoggerProvider, "defaultProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferencesLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __30__CNDDonationPreferences_init__block_invoke;
  v10[3] = &unk_24C2366A8;
  v11 = CFSTR("com.apple.MobileAddressBook");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__CNDDonationPreferences_init__block_invoke_2;
  v8[3] = &unk_24C2366D0;
  v9 = CFSTR("com.apple.MobileAddressBook");
  v6 = -[CNDDonationPreferences initWithNotificationCenter:logger:donationPreferenceCheckingBlock:donationPreferenceSettingBlock:](self, "initWithNotificationCenter:logger:donationPreferenceCheckingBlock:donationPreferenceSettingBlock:", v3, v5, v10, v8);

  return v6;
}

uint64_t __30__CNDDonationPreferences_init__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  int v3;

  v1 = *(id *)(a1 + 32);
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v3 = objc_msgSend(v2, "containsObject:", v1);

  return v3 ^ 1u;
}

void __30__CNDDonationPreferences_init__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v8;

  v8 = *(id *)(a1 + 32);
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v4 = v3;
  if (v3)
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
  else
    v5 = (void *)objc_opt_new();
  v6 = v5;
  if (a2)
  {
    objc_msgSend(v5, "removeObject:", v8);
  }
  else if ((objc_msgSend(v5, "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend(v6, "addObject:", v8);
  }
  CFPreferencesSetAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), v6, CFSTR("com.apple.suggestions"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.suggestions.settingsChanged"), 0, 0, 1u);

}

- (CNDDonationPreferences)initWithNotificationCenter:(id)a3 logger:(id)a4 donationPreferenceCheckingBlock:(id)a5 donationPreferenceSettingBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNDDonationPreferences *v15;
  CNDDonationPreferences *v16;
  uint64_t v17;
  id donationPreferenceCheckingBlock;
  uint64_t v19;
  id donationPreferenceSettingBlock;
  CNDDonationPreferences *v21;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CNDDonationPreferences;
  v15 = -[CNDDonationPreferences init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_notificationCenter, a3);
    objc_storeStrong((id *)&v16->_logger, a4);
    v17 = objc_msgSend(v13, "copy");
    donationPreferenceCheckingBlock = v16->_donationPreferenceCheckingBlock;
    v16->_donationPreferenceCheckingBlock = (id)v17;

    v19 = objc_msgSend(v14, "copy");
    donationPreferenceSettingBlock = v16->_donationPreferenceSettingBlock;
    v16->_donationPreferenceSettingBlock = (id)v19;

    v21 = v16;
  }

  return v16;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE19248], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("donations enabled"), -[CNDDonationPreferences isDonationsEnabled](self, "isDonationsEnabled"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isDonationsEnabled
{
  uint64_t v3;
  void *v4;

  v3 = (*((uint64_t (**)(void))self->_donationPreferenceCheckingBlock + 2))();
  -[CNDDonationPreferences logger](self, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isDonationsEnabled:", v3);

  return v3;
}

- (void)setDonationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CNDDonationPreferences logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDonationsEnabled:", v3);

  (*((void (**)(void))self->_donationPreferenceSettingBlock + 2))();
  -[CNDDonationPreferences notificationCenter](self, "notificationCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("CNDDonationsEnabledPreferencesKey"), 0);

}

+ (id)observableWithPreferences:(id)a3 notificationCenter:(id)a4 schedulerProvider:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BE192A0];
  v8 = a5;
  objc_msgSend(v7, "observableOnDarwinNotificationCenterWithName:", CFSTR("com.apple.suggestions.settingsChanged"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "startWith:scheduler:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __89__CNDDonationPreferences_observableWithPreferences_notificationCenter_schedulerProvider___block_invoke;
  v18[3] = &unk_24C2366F8;
  v19 = v6;
  v14 = v6;
  objc_msgSend(v13, "map:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "distinctUntilChanged");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __89__CNDDonationPreferences_observableWithPreferences_notificationCenter_schedulerProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isDonationsEnabled"));
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (CNDonationPreferencesLogger)logger
{
  return self->_logger;
}

- (id)donationPreferenceCheckingBlock
{
  return self->_donationPreferenceCheckingBlock;
}

- (id)donationPreferenceSettingBlock
{
  return self->_donationPreferenceSettingBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_donationPreferenceSettingBlock, 0);
  objc_storeStrong(&self->_donationPreferenceCheckingBlock, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
