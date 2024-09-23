@implementation MKAccessibilitySettingMigrator

- (MKAccessibilitySettingMigrator)init
{
  MKAccessibilitySettingMigrator *v2;
  MKAccessibilitySettingMigrator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKAccessibilitySettingMigrator;
  v2 = -[MKMigrator init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MKMigrator setType:](v2, "setType:", 0);
  return v3;
}

- (void)importDataEncodedInJSON:(id)a3
{
  MKAccessibilitySettingMigrator *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x2207B99F4](v5);
  -[MKAccessibilitySettingMigrator import:](v4, "import:", v7);
  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v4);

}

- (void)import:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  MKAccessibility *v7;
  MKAccessibility *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  float v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  MKAccessibilitySettingMigrator *v26;
  __int16 v27;
  MKAccessibility *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKLog log](MKLog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (MKAccessibility *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
    v25 = 138412546;
    v26 = self;
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_21EC08000, v6, OS_LOG_TYPE_INFO, "%@ will import. data=%@", (uint8_t *)&v25, 0x16u);

  }
  v8 = -[MKAccessibility initWithData:]([MKAccessibility alloc], "initWithData:", v4);
  +[MKLog log](MKLog, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v25 = 138412546;
    v26 = self;
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_21EC08000, v9, OS_LOG_TYPE_INFO, "%@ did have ax. ax=%@", (uint8_t *)&v25, 0x16u);
  }

  if (-[MKAccessibility enableDisplayInversion](v8, "enableDisplayInversion"))
  {
    +[MKLog log](MKLog, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      v26 = self;
      _os_log_impl(&dword_21EC08000, v10, OS_LOG_TYPE_INFO, "%@ will set invert colors.", (uint8_t *)&v25, 0xCu);
    }

    _AXSInvertColorsSetEnabled();
    +[MKLog log](MKLog, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      v26 = self;
      _os_log_impl(&dword_21EC08000, v11, OS_LOG_TYPE_INFO, "%@ did set invert colors.", (uint8_t *)&v25, 0xCu);
    }

  }
  -[MKAccessibility fontScale](v8, "fontScale");
  if (v12 > 0.0 && v12 != 1.0)
  {
    +[MKLog log](MKLog, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      v26 = self;
      _os_log_impl(&dword_21EC08000, v13, OS_LOG_TYPE_INFO, "%@ will set font scale.", (uint8_t *)&v25, 0xCu);
    }

    _AXSSetPreferredContentSizeCategoryName();
    +[MKLog log](MKLog, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      v26 = self;
      _os_log_impl(&dword_21EC08000, v14, OS_LOG_TYPE_INFO, "%@ did set font scale.", (uint8_t *)&v25, 0xCu);
    }

  }
  +[MKLog log](MKLog, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v25 = 138412290;
    v26 = self;
    _os_log_impl(&dword_21EC08000, v15, OS_LOG_TYPE_INFO, "%@ did import.", (uint8_t *)&v25, 0xCu);
  }

  -[MKMigrator migratorDidImport](self, "migratorDidImport");
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v16);
  objc_msgSend(v16, "payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accessibilitySettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceDate:", v5);
  v21 = v20;

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1518]), "initWithDouble:", v21);
  objc_msgSend(v18, "importElapsedTime");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "decimalNumberByAdding:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setImportElapsedTime:", v24);

  objc_sync_exit(v16);
}

@end
