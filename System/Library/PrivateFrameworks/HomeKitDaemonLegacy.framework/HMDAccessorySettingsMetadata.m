@implementation HMDAccessorySettingsMetadata

- (HMDAccessorySettingsMetadata)init
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  HMDAccessorySettingsMetadata *v15;
  HMDAccessorySettingsMetadata *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productClass");
  HMFProductClassToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.plist"), v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "productClass");

  if (v8 == 6)
  {

    v6 = CFSTR("AudioAccessory-b238.plist");
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resourceURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

  if ((v14 & 1) != 0)
  {
    v15 = -[HMDAccessorySettingsMetadata initWithURL:](self, "initWithURL:", v11);
    v16 = v15;
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot find setting resource at: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v16 = 0;
  }

  return v16;
}

- (HMDAccessorySettingsMetadata)initWithURL:(id)a3
{
  void *v4;
  HMDAccessorySettingsMetadata *v5;
  HMDAccessorySettingGroupMetadata *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  HMDAccessorySettingGroupMetadata *rootGroup;
  HMDAccessorySettingsMetadata *v14;
  objc_super v16;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDAccessorySettingsMetadata;
    v5 = -[HMDAccessorySettingsMetadata init](&v16, sel_init);
    if (v5)
    {
      v6 = [HMDAccessorySettingGroupMetadata alloc];
      v7 = *MEMORY[0x1E0CB7EF8];
      objc_msgSend(v4, "hmf_arrayForKey:", CFSTR("Settings"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDAccessorySettingMetadata settingsWithArrayRepresenation:parentKeyPath:](HMDAccessorySettingMetadata, "settingsWithArrayRepresenation:parentKeyPath:", v8, CFSTR("root"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hmf_arrayForKey:", CFSTR("Groups"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDAccessorySettingGroupMetadata groupsWithArrayRepresenation:parentKeyPath:](HMDAccessorySettingGroupMetadata, "groupsWithArrayRepresenation:parentKeyPath:", v10, CFSTR("root"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HMDAccessorySettingGroupMetadata initWithName:settings:groups:](v6, "initWithName:settings:groups:", v7, v9, v11);
      rootGroup = v5->_rootGroup;
      v5->_rootGroup = (HMDAccessorySettingGroupMetadata *)v12;

    }
    self = v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)propertyDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDAccessorySettingsMetadata rootGroup](self, "rootGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR(", Root = %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (HMDAccessorySettingGroupMetadata)rootGroup
{
  return (HMDAccessorySettingGroupMetadata *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootGroup, 0);
}

@end
