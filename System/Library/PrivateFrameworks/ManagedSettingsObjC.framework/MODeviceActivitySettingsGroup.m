@implementation MODeviceActivitySettingsGroup

+ (id)groupName
{
  return CFSTR("deviceActivity");
}

- (NSSet)allowedClients
{
  return (NSSet *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("allowedClients"));
}

- (void)setAllowedClients:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("allowedClients"));
}

+ (MOApplicationSetSettingMetadata)allowedClientsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MODeviceActivitySettingsGroup_allowedClientsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedClientsMetadata_onceToken != -1)
    dispatch_once(&allowedClientsMetadata_onceToken, block);
  return (MOApplicationSetSettingMetadata *)(id)allowedClientsMetadata_metadata;
}

void __55__MODeviceActivitySettingsGroup_allowedClientsMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOApplicationSetSettingMetadata *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("allowedClients"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MOApplicationSetSettingMetadata alloc];
  v3 = (void *)objc_opt_new();
  LOBYTE(v6) = 0;
  v4 = -[MOSetSettingMetadata initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:", v7, v3, 1, -1, 0, CFSTR("user"), v6);
  v5 = (void *)allowedClientsMetadata_metadata;
  allowedClientsMetadata_metadata = v4;

}

- (NSSet)sharingAppleIDs
{
  return (NSSet *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("sharingAppleIDs"));
}

- (void)setSharingAppleIDs:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("sharingAppleIDs"));
}

+ (MOStringSetSettingMetadata)sharingAppleIDsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MODeviceActivitySettingsGroup_sharingAppleIDsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharingAppleIDsMetadata_onceToken != -1)
    dispatch_once(&sharingAppleIDsMetadata_onceToken, block);
  return (MOStringSetSettingMetadata *)(id)sharingAppleIDsMetadata_metadata;
}

void __56__MODeviceActivitySettingsGroup_sharingAppleIDsMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOStringSetSettingMetadata *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("sharingAppleIDs"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [MOStringSetSettingMetadata alloc];
  v3 = (void *)objc_opt_new();
  LOBYTE(v6) = 1;
  v4 = -[MOSetSettingMetadata initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:](v2, "initWithSettingName:defaultSet:combineOperator:maximumCount:isPublic:scope:isPrivacySensitive:", v7, v3, 1, -1, 0, CFSTR("user"), v6);
  v5 = (void *)sharingAppleIDsMetadata_metadata;
  sharingAppleIDsMetadata_metadata = v4;

}

- (NSNumber)shareAcrossDevices
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("shareAcrossDevices"));
}

- (void)setShareAcrossDevices:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("shareAcrossDevices"));
}

+ (MOBoolSettingMetadata)shareAcrossDevicesMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MODeviceActivitySettingsGroup_shareAcrossDevicesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shareAcrossDevicesMetadata_onceToken != -1)
    dispatch_once(&shareAcrossDevicesMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)shareAcrossDevicesMetadata_metadata;
}

void __59__MODeviceActivitySettingsGroup_shareAcrossDevicesMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("shareAcrossDevices"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 1, 1, 0, CFSTR("user"), 0);
  v3 = (void *)shareAcrossDevicesMetadata_metadata;
  shareAcrossDevicesMetadata_metadata = (uint64_t)v2;

}

@end
