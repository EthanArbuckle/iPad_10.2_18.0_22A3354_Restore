@implementation CKiCloudSettingsUtils

+ (id)specifierWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5
{
  void *v7;
  id v8;
  void *v9;

  v7 = (void *)MEMORY[0x24BE75590];
  v8 = a3;
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, a4, 0, a5, 0, -1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdentifier:", v8);

  objc_msgSend(v9, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  objc_msgSend(v9, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  return v9;
}

+ (id)iCloudSettingsSyncText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("USE_ON_THIS_DEVICE"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)localizedStringWithKey:(id)a3 inPlistNamed:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v7, &stru_2511BE380, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)lastSyncedDateStringForDate:(id)a3 inContext:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = v5;
  if (lastSyncedDateStringForDate_inContext__onceToken == -1)
  {
    if (v5)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)lastSyncedDateStringForDate_inContext__dateFormatter, "setLocale:", v7);
      objc_msgSend((id)lastSyncedDateStringForDate_inContext__timeFormatter, "setLocale:", v7);
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v6);
      v10 = v9;

      if (v10 >= 60.0)
      {
        objc_msgSend((id)lastSyncedDateStringForDate_inContext__dateFormatter, "stringFromDate:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lowercaseStringWithLocale:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)lastSyncedDateStringForDate_inContext__timeFormatter, "stringFromDate:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("SYNC_COMPLETE_ON_DAY_AT_TIME");
        if (!a4)
          v14 = CFSTR("SYNC_DETAILS_FOOTER_TEXT");
        v15 = (void *)MEMORY[0x24BDD17C8];
        v16 = (void *)MEMORY[0x24BDD1488];
        v17 = v14;
        objc_msgSend(v16, "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", v17, &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "stringWithFormat:", v19, v11, v13);
        a4 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SYNC_COMPLETE_JUST_NOW"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
        a4 = objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_12;
    }
  }
  else
  {
    dispatch_once(&lastSyncedDateStringForDate_inContext__onceToken, &__block_literal_global);
    if (v6)
      goto LABEL_3;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOT_SYNCED"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
    a4 = objc_claimAutoreleasedReturnValue();
LABEL_12:

  }
  return (id)a4;
}

uint64_t __63__CKiCloudSettingsUtils_lastSyncedDateStringForDate_inContext___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)lastSyncedDateStringForDate_inContext__dateFormatter;
  lastSyncedDateStringForDate_inContext__dateFormatter = (uint64_t)v0;

  objc_msgSend((id)lastSyncedDateStringForDate_inContext__dateFormatter, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend((id)lastSyncedDateStringForDate_inContext__dateFormatter, "setDateStyle:", 1);
  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v3 = (void *)lastSyncedDateStringForDate_inContext__timeFormatter;
  lastSyncedDateStringForDate_inContext__timeFormatter = (uint64_t)v2;

  return objc_msgSend((id)lastSyncedDateStringForDate_inContext__timeFormatter, "setTimeStyle:", 1);
}

+ (id)sharedNumberFormatter
{
  if (sharedNumberFormatter_onceToken != -1)
    dispatch_once(&sharedNumberFormatter_onceToken, &__block_literal_global_37);
  return (id)sharedNumberFormatter_numberFormatter;
}

uint64_t __46__CKiCloudSettingsUtils_sharedNumberFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)sharedNumberFormatter_numberFormatter;
  sharedNumberFormatter_numberFormatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sharedNumberFormatter_numberFormatter, "setLocale:", v2);

  objc_msgSend((id)sharedNumberFormatter_numberFormatter, "setNumberStyle:", 1);
  return objc_msgSend((id)sharedNumberFormatter_numberFormatter, "setUsesGroupingSeparator:", 1);
}

@end
