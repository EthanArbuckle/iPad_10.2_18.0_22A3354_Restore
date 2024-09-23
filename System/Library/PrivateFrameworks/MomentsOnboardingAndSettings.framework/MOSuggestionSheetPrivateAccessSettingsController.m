@implementation MOSuggestionSheetPrivateAccessSettingsController

- (id)specifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOSuggestionSheetPrivateAccessSettingsController specifier](self, "specifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x24BE75870]);
  v4 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (isValidString(v7))
    {
      v8 = v7;

      v6 = v8;
    }
    objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("CFBundleName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (isValidString(v9))
    {
      v10 = v9;

      v6 = v10;
    }

  }
  else
  {
    v6 = CFSTR("Unknown");
  }
  v31 = v6;
  +[MOSuggestionSheetSettingsController onboardingSettingsBundle](MOSuggestionSheetSettingsController, "onboardingSettingsBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Private Access"), &stru_2513404F8, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = v11;
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("“%@” can show your moments but can only access the items you select."), &stru_2513404F8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v14, v6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, -1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE75D10]);

  objc_msgSend(v15, "setObject:forKeyedSubscript:", NSClassFromString(CFSTR("MODataAccessInfoCell")), *MEMORY[0x24BE75948]);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v33, CFSTR("MOTitle"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v32, CFSTR("MOBody"));
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Suggestion Privacy Settings"), &stru_2513404F8, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, self, 0, 0, 0, 13, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = *MEMORY[0x24BE75868];
  v21 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  objc_msgSend(v19, "setButtonAction:", sel_didTapSuggestionPrivacySettings_);
  v22 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Suggestion Notification Settings"), &stru_2513404F8, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, self, 0, 0, 0, 13, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setProperty:forKey:", v21, v20);
  objc_msgSend(v24, "setButtonAction:", sel_didTapSuggestionNotificationSettings_);
  objc_msgSend(v3, "addObject:", v36);
  objc_msgSend(v3, "addObject:", v15);
  objc_msgSend(v3, "addObject:", v30);
  objc_msgSend(v3, "addObject:", v19);
  objc_msgSend(v3, "addObject:", v24);
  v25 = (int)*MEMORY[0x24BE756E0];
  v26 = *(Class *)((char *)&self->super.super.super.super.super.isa + v25);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v25) = (Class)v3;
  v27 = v3;

  v28 = *(id *)((char *)&self->super.super.super.super.super.isa + v25);
  return v28;
}

- (void)didTapSuggestionPrivacySettings:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=Privacy&path=JOURNALING_SUGGESTIONS"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v4, 0);

}

- (void)didTapSuggestionNotificationSettings:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("app-prefs:com.apple.momentsd.MOUserNotifications&target=com.apple.settings.notifications"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v4, 0);

}

@end
