@implementation IMDSyncedSettingsServiceManager

- (IMDSyncedSettingsServiceManager)init
{
  IMDSyncedSettingsServiceManager *v2;
  IMDSyncedSettingsServiceManager_Impl *v3;
  IMDSyncedSettingsServiceManager_Impl *impl;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMDSyncedSettingsServiceManager;
  v2 = -[IMDSyncedSettingsServiceManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(IMDSyncedSettingsServiceManager_Impl);
    impl = v2->_impl;
    v2->_impl = v3;

  }
  return v2;
}

- (IMDSyncedSettingsServiceManager)initWithLocalDomain:(id)a3 remoteDomain:(id)a4 localStorageDelegate:(id)a5 remoteStorageDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IMDSyncedSettingsServiceManager *v14;
  IMDSyncedSettingsServiceManager_Impl *v15;
  IMDSyncedSettingsServiceManager_Impl *impl;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IMDSyncedSettingsServiceManager;
  v14 = -[IMDSyncedSettingsServiceManager init](&v18, sel_init);
  if (v14)
  {
    v15 = -[IMDSyncedSettingsServiceManager_Impl initWithLocalDomain:remoteDomain:localStorageDelegate:remoteStorageDelegate:]([IMDSyncedSettingsServiceManager_Impl alloc], "initWithLocalDomain:remoteDomain:localStorageDelegate:remoteStorageDelegate:", v10, v11, v12, v13);
    impl = v14->_impl;
    v14->_impl = v15;

  }
  return v14;
}

- (id)settingValueForKey:(int64_t)a3
{
  return -[IMDSyncedSettingsServiceManager_Impl settingValueForKey:](self->_impl, "settingValueForKey:", a3);
}

- (void)setSettingValue:(id)a3 forKey:(int64_t)a4
{
  -[IMDSyncedSettingsServiceManager_Impl setSettingValue:forKey:](self->_impl, "setSettingValue:forKey:", a3, a4);
}

- (IMDSyncedSettingsServiceManager_Impl)impl
{
  return (IMDSyncedSettingsServiceManager_Impl *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
