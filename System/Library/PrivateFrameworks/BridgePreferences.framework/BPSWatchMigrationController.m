@implementation BPSWatchMigrationController

- (BPSWatchMigrationController)init
{
  BPSWatchMigrationController *v2;
  BPSWatchMigrationController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BPSWatchMigrationController;
  v2 = -[BPSWelcomeOptinViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BPSWelcomeOptinViewController setStyle:](v2, "setStyle:", 74);
  return v3;
}

- (BPSWatchMigrationController)initWithSourceDeviceName:(id)a3
{
  id v5;
  BPSWatchMigrationController *v6;
  BPSWatchMigrationController *v7;

  v5 = a3;
  v6 = -[BPSWatchMigrationController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sourceDeviceName, a3);

  return v7;
}

- (BPSWatchMigrationController)initWithSnapshot:(id)a3
{
  void *v4;
  BPSWatchMigrationController *v5;

  objc_msgSend(a3, "deviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BPSWatchMigrationController initWithSourceDeviceName:](self, "initWithSourceDeviceName:", v4);

  return v5;
}

- (BOOL)shouldBeDisplayedGivenMigrationData:(id)a3
{
  id v4;
  NSArray *migratableDevices;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  BOOL v9;

  v4 = a3;
  NSLog(CFSTR("Migration data: (%p - %ld bytes)"), v4, objc_msgSend(v4, "length"));
  migratableDevices = self->_migratableDevices;
  self->_migratableDevices = 0;

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE6B4B8], "sharedMigrator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "devicesFromMigrationConsentRequestData:", v4);
  }
  else
  {
    self->_iTunes = 1;
    objc_msgSend(MEMORY[0x24BE6B4B8], "sharedMigrator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "migratableDevicesRequiringConsent");
  }
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = self->_migratableDevices;
  self->_migratableDevices = v7;

  NSLog(CFSTR("Found %ld devices that are migratable"), -[NSArray count](self->_migratableDevices, "count"));
  v9 = -[NSArray count](self->_migratableDevices, "count") != 0;

  return v9;
}

- (void)loadView
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  NSString *localizedDetailText;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BPSWatchMigrationController;
  -[OBBaseWelcomeController loadView](&v15, sel_loadView);
  v3 = -[NSArray count](self->_migratableDevices, "count");
  -[NSArray firstObject](self->_migratableDevices, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B398]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = self->_sourceDeviceName;
  if (v3 < 1)
  {
    NSLog(CFSTR("Error!! Showing BPSWatchMigrationController with no migratable devices!"));
    -[BPSWatchMigrationController _notifyDelegateShouldMigrateWithData:](self, "_notifyDelegateShouldMigrateWithData:", 0);
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = (v3 - 1);
    if (v6)
    {
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BIXBY_DETAIL_TEXT_FORMAT"), &stru_24CBE59D0, CFSTR("Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v11, v10, v5, v6);
    }
    else
    {
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BIXBY_DETAIL_TEXT_FORMAT_GENERIC_PHONE"), &stru_24CBE59D0, CFSTR("Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v11, v10, v5, v14);
    }
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedDetailText = self->_localizedDetailText;
    self->_localizedDetailText = v12;

  }
}

- (BOOL)useBridgeStyling
{
  return 0;
}

- (id)titleString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BIXBY_SETUP_TITLE"), &stru_24CBE59D0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)detailString
{
  return self->_localizedDetailText;
}

- (id)imageResource
{
  return CFSTR("Screen-Diagnostics");
}

- (id)imageResourceBundleIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)suggestedButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BIXBY_CONTINUE_BUTTON"), &stru_24CBE59D0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)alternateButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BIXBY_SKIP_BUTTON"), &stru_24CBE59D0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  -[BPSWatchMigrationController _saveMigrationPreference:](self, "_saveMigrationPreference:", 1);
}

- (void)alternateButtonPressed:(id)a3
{
  -[BPSWatchMigrationController _saveMigrationPreference:](self, "_saveMigrationPreference:", 0);
}

- (void)_saveMigrationPreference:(BOOL)a3
{
  NSArray *v4;
  uint64_t v5;
  id v6;

  if (a3)
  {
    v4 = self->_migratableDevices;
    if (-[NSArray count](v4, "count"))
    {
      objc_msgSend(MEMORY[0x24BE6B4B8], "migrationDataPreRestoreForConsentedDevices:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v6 = (id)v5;
    -[BPSWatchMigrationController _notifyDelegateShouldMigrateWithData:](self, "_notifyDelegateShouldMigrateWithData:", v5);
    if (v6)
    {
      if (self->_iTunes)
        objc_msgSend(MEMORY[0x24BE6B4B8], "ingestPostRestoreMigrationDataForConsentedDevices:", v6);
    }

  }
  else
  {
    -[BPSWatchMigrationController _notifyDelegateShouldMigrateWithData:](self, "_notifyDelegateShouldMigrateWithData:", 0);
  }
}

- (void)_notifyDelegateShouldMigrateWithData:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a3;
  -[BPSWatchMigrationController migrationDelegate](self, "migrationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v8)
      {
        NSLog(CFSTR("BPSWatchMigrationController notifying delegate should migrate with pre-restore data: (%lu bytes)"), objc_msgSend(v8, "length"));
        v5 = v4;
        v6 = 1;
        v7 = v8;
      }
      else
      {
        NSLog(CFSTR("BPSWatchMigrationController notifying delegate should NOT migrate"));
        v5 = v4;
        v6 = 0;
        v7 = 0;
      }
      objc_msgSend(v5, "controllerItemCompletedWithMigration:preRestoreData:", v6, v7);
    }
    else
    {
      NSLog(CFSTR("BPSWatchMigrationController delegate (%@) does not implement completion callback"), v4);
    }
  }
  else
  {
    NSLog(CFSTR("BPSWatchMigrationController delegate is nil"));
  }

}

- (BPSWatchMigrationControllerDelegate)migrationDelegate
{
  return (BPSWatchMigrationControllerDelegate *)objc_loadWeakRetained((id *)&self->_migrationDelegate);
}

- (void)setMigrationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_migrationDelegate, a3);
}

- (NSString)sourceDeviceName
{
  return self->_sourceDeviceName;
}

- (void)setSourceDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDeviceName, a3);
}

- (NSString)localizedDetailText
{
  return self->_localizedDetailText;
}

- (void)setLocalizedDetailText:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDetailText, a3);
}

- (NSArray)migratableDevices
{
  return self->_migratableDevices;
}

- (void)setMigratableDevices:(id)a3
{
  objc_storeStrong((id *)&self->_migratableDevices, a3);
}

- (BOOL)iTunes
{
  return self->_iTunes;
}

- (void)setITunes:(BOOL)a3
{
  self->_iTunes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migratableDevices, 0);
  objc_storeStrong((id *)&self->_localizedDetailText, 0);
  objc_storeStrong((id *)&self->_sourceDeviceName, 0);
  objc_destroyWeak((id *)&self->_migrationDelegate);
}

@end
