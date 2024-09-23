@implementation MKDisplaySettingMigrator

- (MKDisplaySettingMigrator)init
{
  MKDisplaySettingMigrator *v2;
  MKDisplaySettingMigrator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKDisplaySettingMigrator;
  v2 = -[MKMigrator init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MKMigrator setType:](v2, "setType:", 8);
  return v3;
}

- (void)importDataEncodedInJSON:(id)a3
{
  MKDisplaySettingMigrator *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x2207B99F4](v5);
  -[MKDisplaySettingMigrator import:](v4, "import:", v7);
  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v4);

}

- (void)import:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  MKDisplay *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  MKDisplaySettingMigrator *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKLog log](MKLog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
    v24 = 138412546;
    v25 = self;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_21EC08000, v6, OS_LOG_TYPE_INFO, "%@ will import. data=%@", (uint8_t *)&v24, 0x16u);

  }
  v8 = -[MKDisplay initWithData:]([MKDisplay alloc], "initWithData:", v4);
  if (-[MKDisplay enableDisplayDarkMode](v8, "enableDisplayDarkMode"))
  {
    +[MKLog log](MKLog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = self;
      _os_log_impl(&dword_21EC08000, v9, OS_LOG_TYPE_INFO, "%@ will set dark mode", (uint8_t *)&v24, 0xCu);
    }

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBEC58]), "initWithDelegate:", 0);
    objc_msgSend(v10, "setModeValue:", 2);

    +[MKLog log](MKLog, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = self;
      _os_log_impl(&dword_21EC08000, v11, OS_LOG_TYPE_INFO, "%@ did set dark mode", (uint8_t *)&v24, 0xCu);
    }

  }
  +[MKLog log](MKLog, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v24 = 138412290;
    v25 = self;
    _os_log_impl(&dword_21EC08000, v12, OS_LOG_TYPE_INFO, "%@ will differ display zoom to buddy.", (uint8_t *)&v24, 0xCu);
  }

  -[MKDisplaySettingMigrator setBool:forKey:](self, "setBool:forKey:", -[MKDisplay enableDisplayZoom](v8, "enableDisplayZoom"), CFSTR("enable_display_zoom"));
  +[MKLog log](MKLog, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v24 = 138412290;
    v25 = self;
    _os_log_impl(&dword_21EC08000, v13, OS_LOG_TYPE_INFO, "%@ did differ display zoom to buddy.", (uint8_t *)&v24, 0xCu);
  }

  +[MKLog log](MKLog, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v24 = 138412290;
    v25 = self;
    _os_log_impl(&dword_21EC08000, v14, OS_LOG_TYPE_INFO, "%@ did import.", (uint8_t *)&v24, 0xCu);
  }

  -[MKMigrator migratorDidImport](self, "migratorDidImport");
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v15);
  objc_msgSend(v15, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displaySettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v5);
  v20 = v19;

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v20);
  objc_msgSend(v17, "importElapsedTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "decimalNumberByAdding:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImportElapsedTime:", v23);

  objc_sync_exit(v15);
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  CFPropertyListRef *v4;

  v4 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v4 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetValue((CFStringRef)a4, *v4, CFSTR("com.apple.welcomekit"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

@end
