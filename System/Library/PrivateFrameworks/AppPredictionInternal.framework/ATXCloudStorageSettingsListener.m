@implementation ATXCloudStorageSettingsListener

+ (ATXCloudStorageSettingsListener)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ATXCloudStorageSettingsListener_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, block);
  return (ATXCloudStorageSettingsListener *)(id)sharedInstance_instance_0;
}

void __49__ATXCloudStorageSettingsListener_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v1;

}

- (ATXCloudStorageSettingsListener)init
{
  ATXCloudStorageSettingsListener *v2;
  ATXCloudStorageSettingsListener *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXCloudStorageSettingsListener;
  v2 = -[ATXCloudStorageSettingsListener init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ATXCloudStorageSettingsListener registerForCloudStorageSettingsNotifications](v2, "registerForCloudStorageSettingsNotifications");
  return v3;
}

- (void)registerForCloudStorageSettingsNotifications
{
  -[ATXCloudStorageSettingsListener registerForCloudSyncPreferenceDidChangeNotification](self, "registerForCloudSyncPreferenceDidChangeNotification");
  -[ATXCloudStorageSettingsListener registerForCloudStorageDeletedByUserNotification](self, "registerForCloudStorageDeletedByUserNotification");
}

- (void)registerForCloudStorageDeletedByUserNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleDeleteDataRequest, CFSTR("com.apple.siri.cloud.storage.deleted"), 0);

}

- (void)registerForCloudSyncPreferenceDidChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleBackupPreferencesDidChange, CFSTR("com.apple.siri.cloud.synch.changed"), 0);

}

- (void)handleDeleteDataRequest
{
  -[ATXCloudStorageSettingsDelegate handleDeleteDataRequest](self->_delegate, "handleDeleteDataRequest");
}

- (void)handleBackupPreferencesDidChange
{
  if ((objc_msgSend((id)objc_opt_class(), "isBackupForSiriEnabled") & 1) == 0)
    -[ATXCloudStorageSettingsListener handleDeleteDataRequest](self, "handleDeleteDataRequest");
}

+ (BOOL)isBackupForSiriEnabled
{
  id v2;
  void *v3;
  char v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabledForDataclass:", *MEMORY[0x1E0C8EF18]);

  return v4;
}

+ (BOOL)isBackupForContactsEnabled
{
  id v2;
  void *v3;
  char v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabledForDataclass:", *MEMORY[0x1E0C8F388]);

  return v4;
}

- (ATXCloudStorageSettingsDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
