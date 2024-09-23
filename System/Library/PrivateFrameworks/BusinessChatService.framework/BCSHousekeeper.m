@implementation BCSHousekeeper

- (BCSHousekeeper)initWithUserDefaults:(id)a3
{
  return -[BCSHousekeeper initWithUserDefaults:currentVersion:](self, "initWithUserDefaults:currentVersion:", a3, 1);
}

- (BCSHousekeeper)initWithUserDefaults:(id)a3 currentVersion:(int64_t)a4
{
  id v7;
  BCSHousekeeper *v8;
  BCSHousekeeper *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BCSHousekeeper;
  v8 = -[BCSHousekeeper init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userDefaults, a3);
    v9->_currentVersion = a4;
  }

  return v9;
}

- (void)cleanupDataAtOldPathsIfNeeded
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[BCSHousekeeper userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", CFSTR("BCSHousekeepingCurrentVersion"));

  if (v4 >= -[BCSHousekeeper currentVersion](self, "currentVersion"))
  {
    ABSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[BCSHousekeeper cleanupDataAtOldPathsIfNeeded]";
      v9 = 2048;
      v10 = v4;
      _os_log_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEFAULT, "%s Cleanup not needed. Last completed cleanup task number: %ld", buf, 0x16u);
    }

  }
  else
  {
    -[BCSHousekeeper userDefaults](self, "userDefaults");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInteger:forKey:", -[BCSHousekeeper currentVersion](self, "currentVersion"), CFSTR("BCSHousekeepingCurrentVersion"));

  }
}

- (int64_t)currentVersion
{
  return self->_currentVersion;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
